require 'rails_helper'

describe 'listagem de rastreamentos', type: :system do
  context 'nenhum rastreamento salvo' do
    it 'exibe mensagem' do
      visit '/trackers/index'
      expect(page).to have_text('Não há nenhum registro no momento')
    end
  end
  context 'um rastreamento' do
    it 'lista os dados de rastreamento' do
      create(:tracker)
      visit '/trackers/index'
      expect(page).to have_text('aa5bbb17-cdb9-4618-abfa-db6dd2e00844')
    end
  end
  context 'mais de 50 rastreamentos' do
    it 'lista os 50 últimos registros' do
      create_list(:tracker, 51)
      visit '/trackers/index'
      expect(Tracker).to receive(:order).at_most(50).times
    end
  end
end
