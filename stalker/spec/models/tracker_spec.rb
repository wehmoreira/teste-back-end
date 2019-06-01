require 'rails_helper'

RSpec.describe Tracker, type: :model do
  context 'validação' do
    let(:tracker) { Tracker.new.save }
    it 'deve conter o campo `guid`' do
      expect(tracker).to eq(false)
    end
    it 'deve conter o campo `url`' do
      expect(tracker).to eq(false)
    end
    it 'deve conter o campo `datetime`' do
      expect(tracker).to eq(false)
    end
  end
end
