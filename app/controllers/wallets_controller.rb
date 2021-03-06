class WalletsController < ApplicationController
  before_action :authenticate_user!, :validate_wallet
  skip_before_action :validate_wallet, only: [:verify]

  def show
    @user = helpers.decorate(current_user)
    @wallet = ActiveModel::SerializableResource.new(
    @wallet,
      each_serializer: WalletSerializer
    ).as_json
  end

  def deposit
    url = paystack.deposit_funds(params[:amount])
    json_response(data: { url: url })
  end

  def verify
    paystack.verify_transaction(params[:trxref])
    redirect_to user_root_url
  end

  private

  def wallet
    @wallet ||= Wallet.find_by(user: current_user, currency: currency)
  end

  def currency
    @currency ||= Currency.find_by(code: params[:code])
  end

  def paystack
    PaystackService.new(user: current_user,
                        wallet: @wallet,
                        currency: @currency)
  end

  def validate_wallet
    redirect_to(root_path) unless wallet
  end
end
