# frozen_string_literal: true

class Transaction < ApplicationRecord
  enum trans_type: %i[deposit withdrawal exchange]
  enum status: %i[successful pending failed]

  validates_presence_of :amount, :status, :transaction_ref, :trans_type
  validates_associated :wallet

  belongs_to :wallet
end
