Rails.application.routes.draw do
  get 'home/about'
  resources :posts

  root "posts#index"
end
