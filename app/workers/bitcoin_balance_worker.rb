# frozen_string_literal:true

# Bitcoin balance worker - updates user's btc balance
class BitcoinBalanceWorker
  include Sidekiq::Worker

  def perform
    addresses = Wallet.includes(:currency)
                      .where({ currencies: { code: 'BTC' } })
                      .where.not(number: nil).pluck(:number, :balance)
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
