module Suricate::Newrelic
  class ResponseTimesLineChartCollector
    def initialize(options = {})
      @client  = Client.new(options.delete(:api_key))
      @app_id  = options.delete(:app_id)
      @color   = options.delete(:color)
      @options = options
    end

    def populate(response, options = {})
      metrics = response_times
      dates = metrics.map { |metric| metric.at.strftime('%d/%m - %T') }
      response.chart do |chart|
        chart.labels dates
        chart.serie do |serie|
          serie.name 'Response time'
          serie.values metrics.map(&:value)
          serie.color @color
        end
      end
    end

    private
    def response_times
      @client.get_app_response_times(@app_id, @options)
    end
  end
end
