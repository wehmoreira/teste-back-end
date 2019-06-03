Rails.application.routes.draw do
  resources :contacts, except: [ :edit, :show, :update, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'contacts#index'
  get '/contato', to: 'contacts#new'
  get '/sobre', to: 'contacts#sobre'
  root 'contacts#index'
end
