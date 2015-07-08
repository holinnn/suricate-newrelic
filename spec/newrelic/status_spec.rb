require 'spec_helper'

RSpec.describe Suricate::Newrelic::Status do
  describe '#ok?' do
    it 'returns true only if green color' do
      subject = Suricate::Newrelic::Status.new('green')
      expect(subject.ok?).to be_truthy
      expect(subject.warning?).to be_falsy
      expect(subject.alert?).to be_falsy
    end
  end

  describe '#warning?' do
    it 'returns true only if yellow color' do
      subject = Suricate::Newrelic::Status.new('yellow')
      expect(subject.warning?).to be_truthy
      expect(subject.ok?).to be_falsy
      expect(subject.alert?).to be_falsy
    end
  end

  describe '#alert?' do
    it 'returns true only if red color' do
      subject = Suricate::Newrelic::Status.new('red')
      expect(subject.alert?).to be_truthy
      expect(subject.warning?).to be_falsy
      expect(subject.ok?).to be_falsy
    end
  end
end
