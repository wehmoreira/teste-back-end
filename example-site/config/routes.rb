Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/home')
  resources :contacts, except: [ :edit, :show, :update, :destroy ]
  get '/home', to: 'contacts#index'
  get '/contato', to: 'contacts#new'
  get '/sobre', to: 'contacts#sobre'
end
