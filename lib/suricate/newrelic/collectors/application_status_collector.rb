module Suricate::Newrelic
  class ApplicationStatusCollector
    def initialize(options = {})
      @client  = Client.new(options[:api_key])
      @app_id  = options[:app_id]
    end

    def populate(response, options = {})
      status = application.status
      if status.ok?
        response.ok!
      elsif status.warning?
        response.warning!
      elsif status.alert?
        response.alert!
      end
    end

    private
    def application
      @client.get_application(@app_id)
    end
  end
end
