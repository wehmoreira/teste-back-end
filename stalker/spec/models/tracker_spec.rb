require 'rails_helper'

RSpec.describe Tracker, type: :model do
  context 'validação' do
    subject { build(:tracker) }
    let(:saved) { subject.save }
    context 'guid' do
      it 'deve conter o campo `guid`' do
        subject.guid = nil
        expect(saved).to eq(false)
      end
      it 'valida a formatação de um guid' do
        subject.guid = "Lorem ipsum dolor sit amet"
        expect(saved).to eq(false)
      end
    end
    context 'url' do
      it 'deve conter o campo `url`' do
        subject.url = nil
        expect(saved).to eq(false)
      end
      it 'valida a formatação de um url' do
        subject.url = "Lorem ipsum dolor sit amet"
        expect(saved).to eq(false)
      end
    end
    context 'datetime' do
      it 'deve conter o campo `datetime`' do
        subject.datetime = nil
        expect(saved).to eq(false)
      end
      it 'valida a formatação de data e hora' do
        subject.datetime = "Lorem ipsum dolor sit amet"
        expect(saved).to eq(false)
      end
    end
  end
end
