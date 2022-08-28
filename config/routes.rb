

Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  telegram_webhook TelegramWebhooksController

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  resources :supply_products
  resources :supply_costs

  devise_for :users

  get '/users/settings', to: 'user_settings#show', as: 'profile_page'

  get "dashboard/index"
  root to: "dashboard#index"
  resources :products
  resources :supplies do
    post :update_count, to: 'supplies#update_count'
    post :update_costs, to: 'supply_costs#supply_cost_update'
    get :google_export, to: 'supplies#google_export', as: :google_export
  end

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
