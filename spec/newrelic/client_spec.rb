require 'spec_helper'
require 'json'

RSpec.describe Suricate::Newrelic::Client do
  subject { Suricate::Newrelic::Client.new('key') }

  describe '#get_application_call_times' do
    it 'returns an array with response times' do
      json = JSON.parse(File.read(resource_path('response_times.json')))
      expect(subject).to receive(:get).and_return(json)

      response_times = subject.get_app_response_times(2)
      expect(response_times.size).to eq(4)
      response_time = response_times.first

      expect(response_time.value).to eq(53.9)
      expect(response_time.at).to eq(DateTime.parse('2015-07-07T13:58:00+00:00').to_time)
      expect(response_time.calls_count).to eq(374)
    end
  end

  describe '#get_application' do
    it 'returns infos about an application' do
      json = JSON.parse(File.read(resource_path('application.json')))
      expect(subject).to receive(:get).and_return(json)

      application = subject.get_application(2324)
      expect(application.id).to eq(2324)
      expect(application.status.ok?).to be_truthy
      expect(application.name).to eq('api-production')
    end
  end
end
