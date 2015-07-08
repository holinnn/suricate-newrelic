module Suricate
  module Newrelic
    autoload :Client,                          'suricate/newrelic/client'
    autoload :ResponseTimeMetric,              'suricate/newrelic/response_time_metric'
    autoload :Application,                     'suricate/newrelic/application'
    autoload :Status,                          'suricate/newrelic/status'

    # Collectors
    autoload :ResponseTimesLineChartCollector,  'suricate/newrelic/collectors/response_times_line_chart_collector'
    autoload :ApplicationStatusCollector,       'suricate/newrelic/collectors/application_status_collector'
  end
end
