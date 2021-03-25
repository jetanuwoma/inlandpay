# frozen_string_literal: true

class Currency < ApplicationRecord
  enum status: %i[active inactive not_set]
  validates_presence_of :name, :symbol, :code, :rate
  has_many :wallets

  scope :by_symbol, ->(symbol) { where(symbol: symbol) }

  def self.code_to_symbol(code)
    where(code: code).first.symbol
  end

  def self.exchange(amount)
    rate * amount
  end
end
