Rails.application.routes.draw do
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/password#new' 
    get '/users/sign_out', to: 'devise/sessions#destroy' 
  end

  devise_for :users

  get 'home/about'
  resources :posts

  root "posts#index"
end
