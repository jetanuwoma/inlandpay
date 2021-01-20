class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.string :symbol, null: false
      t.string :code, null: false
      t.string :hundreds_name, null: false, default: 'one thousand'
      t.decimal :rate, null: false
      t.string :logo, null: true
      t.integer :default, null: false, default: 0
      t.string :exchange_from, null: false, default: 'local'
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end