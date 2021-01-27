class WalletsController < ApplicationController
  before_action :authenticate_user!, :validate_wallet

  def show
    @user = helpers.decorate(@user)
    @wallet = ActiveModel::SerializableResource.new(
    @wallet,
      each_serializer: WalletSerializer
    ).as_json
  end

  private

  def wallet
    @wallet ||= Wallet.find_by(user: user, currency: currency)
  end

  def user
    @user ||= current_user
  end

  def currency
    @currency ||= Currency.find_by(code: params[:code])
  end

  def validate_wallet
    redirect_to(root_path) unless wallet
  end
end
