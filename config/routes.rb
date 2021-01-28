require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  root to: 'home#index'
  get 'account', to: 'home#account', as: 'user_root'

  get 'wallets/:code', to: 'wallets#show', as: :show_wallet
  post 'wallets/:code/deposit', to: 'wallets#deposit', as: :deposit_wallet

  devise_for :users

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
