Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  authenticate :user, -> (u) { u.admin? } do # Supposing there is a User#admin? method
    mount ActiveAnalytics::Engine, at: "analytics" # http://localhost:3000/analytics
  end

  get 'profiles/index'

  resources :likes, only: [ :create, :destroy ]
  resources :comments
  
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/password#new' 
    get '/users/sign_out', to: 'devise/sessions#destroy' 
    get '/users/edit', to: 'devise/registrations#edit'
  end
  
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: [:show]

  post 'users/:id/follow', to: "users#follow", as: "follow"
  post 'users/:id/unfollow', to: "users#unfollow", as: "unfollow"
  post 'users/:id/accept', to: "users#accept", as: "accept"
  post 'users/:id/decline', to: "users#decline", as: "decline"
  post 'users/:id/cancel', to: "users#cancel", as: "cancel"

  get 'home/about'
  get 'posts/myposts'
  resources :posts

  root "posts#index"
end
