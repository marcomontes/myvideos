Rails.application.routes.draw do
  
  root to: 'youtube#index'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  resources :users
  resources :youtube, only: [:index]
end
