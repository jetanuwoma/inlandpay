# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[account]

  def index; end

  def account
    @user = helpers.decorate(current_user)
    @wallets = ActiveModel::SerializableResource.new(
      current_user.wallets,
      each_serializer: WalletSerializer
    ).as_json
  end
end
