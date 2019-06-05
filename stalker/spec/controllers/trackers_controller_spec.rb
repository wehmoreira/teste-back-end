# Mantive aqui os testes inalterados ao gerar o controller. Preferi utilizar os
# request specs para testar o controller, seguindo recomendação da equipe do RSpec
require 'rails_helper'

RSpec.describe TrackersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

end
