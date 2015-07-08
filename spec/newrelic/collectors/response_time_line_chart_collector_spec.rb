require 'spec_helper'

RSpec.describe Suricate::Newrelic::ResponseTimesLineChartCollector do
  let(:response_times) { [Suricate::Newrelic::ResponseTimeMetric.new(Date.new(2015, 7, 7), 50, 23)] }

  describe '#populate' do
    it 'populates response with chart data' do
      expect(subject).to receive(:response_times).and_return(response_times)
      response = Suricate::ChartWidgetResponse.new
      subject.populate(response)
      expect(response.to_h).to eq({
        status: 'ok',
        chart: {
          labels: ["07/07 - 00:00:00"],
          series: [
            {
              name:"Response time",
              values:[50],
              color: nil
            }
          ]
        }
      })
    end
  end
end
