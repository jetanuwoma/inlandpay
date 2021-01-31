# frozen_string_literal: true

# Paystack service - handles deposit and withdrawal of funds
class PaystackService
  def initialize(user:, wallet:, currency:)
    @user = user
    @wallet = wallet
    @currency = currency

    paystack = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
    @transaction = PaystackTransactions.new(paystack)
  end

  def deposit_funds(amount)
    reference = "user#{@user.id}#{Time.now.to_i}"
    result = @transaction.initializeTransaction(
      reference: reference,
      amount: amount,
      email: @user.email
    )
    deposit = Transaction.create!(
      amount: amount,
      transaction_ref: reference,
      wallet: @wallet,
      trans_type: Transaction.trans_types[:deposit]
    )

    return result['data']['authorization_url'] if deposit

    false
  rescue StandardError => e
    puts e
    false
  end

  def verify_transaction(txref)
    transaction = Transaction.find_by!(transaction_ref: txref)
    return 'Error depositing funds' unless transaction

    result = @transaction.verify(txref)
    data = result.with_indifferent_access
    transaction.status = Transaction.statuses[:failed]
    if data[:data][:status] == 'success'
      transaction.status = Transaction.statuses[:successful]
      transaction.wallet.balance = transaction.wallet.balance + data[:data][:amount]
      transaction.wallet.save
    end
    transaction.save
  rescue StandardError => e
    p e
    'Error depositing funds'
  end
end

