Rails.application.routes.draw do
  
  root to: 'youtube#index'
  devise_for :people

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/user_signout' => 'sessions#destroy', :as => :user_signout
  get '/auth/failure' => 'sessions#failure'

  resources :users
  resources :youtube, only: [:index]
end
