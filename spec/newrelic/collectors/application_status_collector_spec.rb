require 'spec_helper'

RSpec.describe Suricate::Newrelic::ApplicationStatusCollector do
  let(:response) { double('response') }
  let(:application) { Suricate::Newrelic::Application.new(status: status) }
  let(:status) { double('status') }

  describe '#populate' do
    before(:each) do
      expect(subject).to receive(:application).and_return(application)
    end

    it 'calls alert! if application status is bad' do
      expect(status).to receive(:ok?).and_return(true)
      expect(response).to receive(:ok!)
      subject.populate(response)
    end

    it 'calls warning! if application status is quite bad' do
      expect(status).to receive(:ok?).and_return(false)
      expect(status).to receive(:warning?).and_return(true)
      expect(response).to receive(:warning!)
      subject.populate(response)
    end

    it 'calls ok! if application status is good' do
      expect(status).to receive(:ok?).and_return(false)
      expect(status).to receive(:warning?).and_return(false)
      expect(status).to receive(:alert?).and_return(true)
      expect(response).to receive(:alert!)
      subject.populate(response)
    end
  end
end
