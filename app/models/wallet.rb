# frozen_string_literal: false

class Wallet < ApplicationRecord
  enum is_default: %i[Yes No]

  validates_presence_of :balance, :is_default
  validates_associated :currency, :user

  belongs_to :user
  belongs_to :currency
end
