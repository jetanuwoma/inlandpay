# frozen_string_literal: false

class Wallet < ApplicationRecord
  enum is_default: %i[Yes No]

  validates_uniqueness_of :number, conditions: -> { where.not(number: nil) }
  validates_presence_of :balance, :is_default
  validates_associated :currency, :user

  belongs_to :user
  belongs_to :currency

  before_create :assign_number
  after_create :generate_btc_address

  private

  def assign_number
    code = currency.code
    self.number = rand(10**10) if code == 'NGR'
  end

  def generate_btc_address
    code = currency.code
    return true unless code == 'BTC'

    BitcoinService.new(user_id: user.id, currency_id: currency.id).generate_address
  end
end
