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
      guid = create(:tracker).guid
      visit '/trackers/index'
      expect(page).to have_text(guid)
    end
  end
  context 'mais de 50 rastreamentos' do
    it 'lista os 50 últimos registros' do
      trackers = create_list(:tracker, 51)
      visit '/trackers/index'
      expect(page).not_to have_text(trackers.first.guid)
      expect(page).to have_text(trackers[1].guid)
      expect(page).to have_text(trackers.last.guid)
    end
  end
end
