Rails.application.routes.draw do
  resources :contacts, except: [ :edit, :show, :update, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/contacts/home', to: 'contacts#index'
  get '/contacts/contato', to: 'contacts#new'
  get '/contacts/sobre', to: 'contacts#sobre'
  root 'contacts#index'
end
