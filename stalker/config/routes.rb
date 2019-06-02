Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'trackers', to: 'apis#create', defaults: { format: :json }
    end
  end
  get 'trackers/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
