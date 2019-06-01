# Mantive aqui os testes inalterados ao gerar o controller. Preferi utilizar os
# request specs para testar o controller, seguindo recomendação da equipe do RSpec
require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
