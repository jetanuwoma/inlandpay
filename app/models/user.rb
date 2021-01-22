# frozen_string_literal

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  validates_presence_of :first_name, :last_name, :email, :phone_number
  validates_uniqueness_of :email

  has_many :wallets
  after_create :set_up_wallets

  private

  def set_up_wallets
    WalletSetupWorker.perform_async(id)
  end

end
