class AddMetadataToWallet < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :metadata, :json, null: true
  end
end
