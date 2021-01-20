# frozen_string_literal: false

class Wallet < ApplicationRecord
  enum is_default: %i[Yes No]

  validates_associated :currency, :user

  belongs_to :user
  has_one :currency
end
