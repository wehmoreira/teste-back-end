require 'rails_helper'

describe 'testes performáticos', type: :request do
  context 'carga da API' do
    let(:request) { post '/api/v1/trackers', :params => { tracker: tracker_params } }
    let(:tracker_params) { FactoryBot.attributes_for(:tracker) }
    it 'sustenta até 100_000 requisições por segundo' do
      expect { request }.to perform_at_least(1_000_000).ips
    end
    it 'carrega o registro em menos de 0.01s' do
      expect { request }.to perform_under(0.01).sample(10).times
    end
    # Infelizmente a alocação de objetos utilizados é muito complexa utilizando Rails.
    # No exemplo abaixo, ele vai obter todos os objetos criados não somente no
    # ApisController, mas também em toda aplicação que subiu para rodar o request e mais
    # os objetos utilizados no RSpec (o número de alocações muda com o reposicionamento
    # deste teste).
    example('alocação de recursos', pending: 'checar comentário') do
      expect { request }.to perform_allocation({Hash => 1, Tracker => 1, Array => 1}).objects
    end
  end
end
