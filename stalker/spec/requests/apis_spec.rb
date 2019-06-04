require 'rails_helper'

describe 'funcionamento da API', :type => :request do
  describe "POST #create" do
    let(:request) { post '/api/v1/trackers', :params => { tracker: tracker_params } }
    let(:tracker_params) { FactoryBot.attributes_for(:tracker) }
    context 'requisição bem-sucedida à API' do
      context 'JSON' do
        before { request }
        it 'retorna status 200' do
          expect(response).to be_successful
        end
        it 'responde um JSON com mensagem de sucesso' do
          json_res = JSON.parse(response.body)
          expect(json_res).to eq({ 'message' => 'OK' })
        end
      end
      context 'Modelo' do
        it 'cria um registro de rastreamento' do
          expect { request }.to change(Tracker, :count).by(1)
        end
      end
    end
    context 'requisição malsucedida à API' do
      let(:tracker_params) do
        { guid: 'a-1', url: 'http://localhost:8080/', datetime: '2019-6-2 17:34:50' }
      end
      context 'JSON' do
        before { request }
        it 'retorna status 500' do
          expect(response).not_to be_successful
        end
        it 'responde um JSON com mensagem de erro' do
          json_res = JSON.parse(response.body)
          expect(json_res).to eq({ 'message' => {"guid"=>["guid inválido"]} })
        end
      end
      context 'Modelo' do
        it 'não cria um registro de rastreamento' do
          expect { request }.not_to change(Tracker, :count)
        end
      end
    end
  end
end
