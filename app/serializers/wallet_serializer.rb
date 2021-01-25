# frozen_string_literal: true

class WalletSerializer < ActiveModel::Serializer
  attributes :id, :name, :balance, :code
  belongs_to :currency

  def name
    object.currency.name
  end

  def code
    object.currency.code
  end
end
