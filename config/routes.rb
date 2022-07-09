require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  devise_for :users

  get "dashboard/index"
  root to: "dashboard#index"
  resources :products
  resources :supplies

  resources :markets do
    resources :campaigns do
      get 'api_update', to: 'campaigns#api_update'

      resources :imports
      resources :costs
      resources :orders
      resources :products
    end
  end
end
