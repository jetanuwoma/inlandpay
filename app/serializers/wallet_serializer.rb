# frozen_string_literal: true

class WalletSerializer < ActiveModel::Serializer
  attributes :id, :name, :balance, :code, :symbol
  belongs_to :currency

  def name
    object.currency.name
  end

  def code
    object.currency.code
  end

  def symbol
    object.currency.symbol
  end
end
