require 'net/http'
require 'json'
require 'date'

module Suricate::Newrelic
  class Client
    def initialize(api_key)
      @api_key = api_key
      @url     = 'https://api.newrelic.com/v2'
    end

    def get_app_response_times(app_id, options = {})
      params = {
        from: (options[:from] || (Time.now - 3600 * 14)),
        to:   (options[:to] || Time.now),
        period: (options[:period] || 60 * 30),
        'values[]' => %w(average_call_time call_count),
        'names[]' => %w(HttpDispatcher)
      }

      path = "/applications/#{app_id}/metrics/data.json"
      json    = get(path, params)
      metrics = json['metric_data']['metrics'][0]['timeslices']
      build_response_times(metrics)
    end

    def get_application(app_id)
      path = "/applications/#{app_id}.json"
      json = get(path)
      build_application(json['application'])
    end

    private
    def get(path, params = {})
      uri       = URI.parse(@url + path)
      uri.query = URI.encode_www_form(params)

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        request = Net::HTTP::Get.new(uri)
        request['X-Api-Key'] = @api_key
        http.request(request)
      end

      JSON.parse(response.body)
    end



    def build_response_times(json)
      json.map do |entry|
        ResponseTimeMetric.new(DateTime.parse(entry['to']).to_time.getlocal,
                               entry['values']['average_call_time'],
                               entry['values']['call_count'])
      end
    end

    def build_application(json)
      Application.new(id: json['id'],
                      status: Status.new(json['health_status']),
                      name: json['name'])
    end
  end
end
