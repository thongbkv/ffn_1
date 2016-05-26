Rails.application.routes.draw do
  resources :seasons
  devise_for :users
  root "static_pages#home"
  get "static_pages/help"

  namespace :admin do
    resources :matches do
        end
  end
end
