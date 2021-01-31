class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :status, null: false, default: 1
      t.decimal :amount, null: false
      t.string :transaction_ref, null: false
      t.json :metadata, null: true
      t.integer :trans_type, null: false

      t.references :wallet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
