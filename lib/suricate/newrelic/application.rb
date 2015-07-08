module Suricate::Newrelic
  class Application
    attr_reader :id, :name, :status

    def initialize(options = {})
      @id     = options[:id]
      @name   = options[:name]
      @status = options[:status]
    end
  end
end
