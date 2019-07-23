Rails.application.routes.draw do
  namespace :admin do
      resources :webhooks

      root to: "webhooks#index"
    end
  # resources :webhooks
  get 'webhooks/:id', to: 'webhooks#handle'
  get 'logout', to: 'application#logout'
  # get 'webhooks', to: 'webhooks#index'

  # root 'webhooks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
