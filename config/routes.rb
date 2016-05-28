Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  root "admin_seasons#index"
  get "static_pages/help"

  namespace :admin do
    resources :seasons
    resources :matches
    resources :players
    resources :teams
    resources :posts
  end
end
