module Suricate::Newrelic
  class ResponseTimeMetric
    attr_reader :at, :value, :calls_count

    def initialize(at, value, calls_count)
      @at          = at
      @value       = value
      @calls_count = calls_count
    end
  end
end
