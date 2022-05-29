require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app


  resources :costs
  resources :orders
  resources :products
	devise_for :users

	get "dashboard/index"
	root to: "dashboard#index"


	resources :markets do
		resources :campaigns do
      resources :imports
    	get 'api_update', to: 'campaigns#api_update'
    end
	end
end
