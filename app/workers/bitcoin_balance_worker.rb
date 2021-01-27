# frozen_string_literal:true

# Bitcoin balance worker - updates user's btc balance
class BitcoinBalanceWorker
  include Sidekiq::Worker

  def perform
    btc = Currency.find_by(code: 'BTC')
    addresses = Wallet.where(currencies: btc).where.not(number: nil).pluck(:number, :balance)
    Async do
      addresses.each do |addrs, amount|
        Async do
          balance = BitcoinService.new.check_balance(addrs)
          if balance
            hashed = balance.with_indifferent_access
            if amount != hashed[:final_balance]
              wallet = Wallet.find_by!(number: addrs)
              wallet.balance = hashed[:final_balance]
              wallet.save!
            end
          end
        end
      end
    end
  end
end
