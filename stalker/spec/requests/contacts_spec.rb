require 'rails_helper'

describe 'página de contatos salvos' do
  describe 'GET #index' do
    context 'nenhum contato salvo' do
      before { get '/contacts/index' }
      it "returns http success" do
        expect(response).to be_successful
      end
      it 'retorna uma mensagem' do
        expect(flash[:info]).to be_present
      end
    end
    context 'contatos salvos' do
      before { allow(Contact).to receive(:all).and_return(create_list(:contact, 2)) }
      it 'não retorna uma mensagem' do
        get '/contacts/index'
        expect(flash[:info]).not_to be_present
      end
    end
  end
end
