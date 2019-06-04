require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'validação' do
    subject { build(:contact) }
    let(:saved) { subject.save }
    context 'email' do
      it 'deve conter o campo `email`' do
        subject.email = nil
        expect(saved).to eq(false)
      end
      it 'valida a formatação de um email' do
        subject.email = "Lorem ipsum dolor sit amet"
        expect(saved).to eq(false)
      end
    end
    context 'nome' do
      it 'deve conter o campo `nome`' do
        subject.nome = nil
        expect(saved).to eq(false)
      end
    end
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
  end
end
