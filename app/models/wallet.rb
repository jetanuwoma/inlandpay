# frozen_string_literal: false

class Wallet < ApplicationRecord
  enum is_default: %i[Yes No]

  validates_presence_of :balance, :is_default
  validates_associated :currency, :user

  belongs_to :user
  belongs_to :currency

  before_create :assign_number

  private

  def assign_number
    code = currency.code
    self.number = rand(10**10) if code == 'NGR'
  end
end
