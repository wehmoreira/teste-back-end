require 'rails_helper'

RSpec.describe 'Geração do relatório de rastreamento', :type => :request do
  describe "GET #index" do
    context 'não possui nenhum rastreio salvo' do
      before { get '/trackers/index' }
      it "returns http success" do
        expect(response).to be_successful
      end
      it 'retorna uma mensagem' do
        expect(flash[:info]).to be_present
      end
    end
    context 'possui rastreios salvos' do
      before do
        allow(Tracker).to receive(:all).and_return(create_list(:tracker, 1+rand(4)))
        get '/trackers/index'
      end
      it 'não exibe mensagem' do
        expect(flash[:info]).not_to be_present
      end
    end
  end
end
