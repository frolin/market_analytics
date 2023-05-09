Rails.application.routes.draw do
  resources :unit_economics
  resources :source_reports
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  # Configure Sidekiq-specific session middleware
  Sidekiq::Web.use ActionDispatch::Cookies
  Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

  mount Yabeda::Prometheus::Exporter, at: "/metrics" if Rails.env.production?

  telegram_webhook TelegramWebhooksController, ENV['BOT_NAME'].to_sym

  root to: "dashboard#index"
  devise_for :users, controller: SessionsController

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :supply_products
  resources :supply_costs

  get '/users/settings', to: 'user_settings#show', as: 'profile_page'

  get "dashboard/index"
  post "dashboard/index", to: 'dashboard#index'

  resources :products
  resources :supplies do
    post :update_count, to: 'supplies#update_count'
    post :update_costs, to: 'supply_costs#supply_cost_update'
    get :google_export, to: 'supplies#google_export', as: :google_export
  end

  resources :stores do
    get 'api_update', to: 'store#api_update'

    resources :imports
    resources :costs
    resources :orders
    resources :sales
    resources :products
  end
end
