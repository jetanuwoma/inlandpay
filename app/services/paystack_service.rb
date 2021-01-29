# frozen_string_literal: true

# Paystack service - handles deposit and withdrawal of funds
class PaystackService
  def initialize(user:, wallet:, currency:)
    @user = user
    @wallet = wallet
    @currency = currency

    @paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
  end

  def deposit_funds(amount)
    transactions = PaystackTransactions.new(@paystackObj)
    result = transactions.initializeTransaction(
      reference: "user#{@user.id}#{Time.now.to_i}",
      amount: amount,
      email: @user.email
    )
    result['data']['authorization_url']
  rescue StandardError => e
    puts e
    false
  end
end

