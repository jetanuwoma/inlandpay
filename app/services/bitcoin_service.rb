# frozen_string_literal: true

# Bitcoin operation service
class BitcoinService
  def initialize(user_id:, currency_id: nil)
    @user_id = user_id
    @currency_id = currency_id
    @blockcypher = BlockCypher::Api.new(api_token: ENV['BLOCKCYPHER_TOKEN'], network: BlockCypher::TEST_NET_3)
  end

  def generate_address
    address = @blockcypher.address_generate
    response = address.with_indifferent_access
    wallet = Wallet.find_by!(currency_id: @currency_id, user_id: @user_id)
    wallet.number = response[:address]
    wallet.metadata = address
    wallet.save!
  rescue StandardError => e
    puts e.message
    false
  end
end
