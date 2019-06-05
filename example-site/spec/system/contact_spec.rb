require 'rails_helper'

describe 'cadastramento de contatos', type: :system, js: true do
  let(:attrs) { attributes_for(:contact) }
  context 'preenchendo com email já existente na base' do
    it 'exibe mensagem de erro' do
      email = create(:contact).email
      visit '/contato'
      fill_in 'contact[nome]', with: attrs[:nome]
      fill_in 'contact[email]', with: email
      click_button 'Enviar'
      expect(page).to have_text 'Email já existente!'
    end
  end
  before { visit '/contato' }
  context 'preenchendo somente o email' do
    it 'exibe mensagem de erro' do
      fill_in 'contact[email]', with: attrs[:email]
      click_button 'Enviar'
      expect(page).to have_text 'Nome deve ser preenchido!'
    end
  end
  context 'preenchendo com email inválido' do
    it 'exibe mensagem de erro' do
      fill_in 'contact[email]', with: 'Lorem ipsum'
      click_button 'Enviar'
      expect(page).to have_text 'Email inválido!'
    end
  end
  context 'preenchendo somente o nome' do
    it 'exibe mensagem de erro' do
      fill_in 'contact[nome]', with: attrs[:nome]
      click_button 'Enviar'
      expect(page).to have_text 'Email deve ser preenchido!'
    end
  end
  context 'parâmetros válidos' do
    it 'gera um cookie para o guid' do
      expect(page.driver.browser.manage.cookie_named("guid")).to include(name: "guid")
    end
    it 'exibe mensagem de sucesso' do
      fill_in 'contact[nome]', with: attrs[:nome]
      fill_in 'contact[email]', with: attrs[:email]
      click_button 'Enviar'
      expect(page).to have_text 'Contato incluído!'
    end
  end
end
