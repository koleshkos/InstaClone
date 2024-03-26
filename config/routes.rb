Rails.application.routes.draw do
  resources :comments
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/password#new' 
    get '/users/sign_out', to: 'devise/sessions#destroy' 
    get '/users/edit', to: 'devise/registrations#edit'
  end

  get 'home/about'
  get 'posts/myposts'
  resources :posts

  root "posts#index"
end
