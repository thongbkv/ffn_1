Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}

  root "static_pages#home"
  get "static_pages/help"

  resources :posts, only: [:index, :show]

  namespace :admin do
    root "seasons#index"
    resources :seasons
    resources :matches
    resources :players
    resources :teams
    resources :posts
    resources :users
  end
end
