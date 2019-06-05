require 'rails_helper'

describe 'listagem de contatos', type: :system do
  context 'nenhum contato salvo' do
    it 'exibe mensagem' do
      visit '/contacts/index'
      expect(page).to have_text('Não há nenhum registro no momento')
    end
  end
  context 'um ou mais registros salvos' do
    it 'carrega múltiplos contatos' do
      create_list(:contact, 1+rand(5))
      visit '/contacts/index'
      expect(page).to have_text('aa5bbb17-cdb9-4618-abfa-db6dd2e00844', between: 1..4)
    end
  end
end
