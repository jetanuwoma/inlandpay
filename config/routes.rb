require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'
  get 'account', to: 'home#account', as: 'user_root'

  devise_for :users

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
