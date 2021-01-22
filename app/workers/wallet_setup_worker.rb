# frozen_string_literal: true

# Set up all wallet after account creation
class WalletSetupWorker
  include Sidekiq::Worker

  def perform(id)
    currencies = Currency.all
    user = User.find(id)
    is_default = 0
    currencies.each do |currency|
      is_default = 1 unless currency.code != 'USD'
      Wallet.find_or_create_by!(balance: 0, currency: currency, is_default: is_default, user: user)
    end
  end
end