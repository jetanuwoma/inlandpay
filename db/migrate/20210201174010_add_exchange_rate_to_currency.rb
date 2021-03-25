class AddExchangeRateToCurrency < ActiveRecord::Migration[6.1]
  def change
    add_column :currencies, :exchange_rate, :decimal, null: true
  end
end
