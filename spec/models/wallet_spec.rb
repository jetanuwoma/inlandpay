require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context 'validation test' do
    describe 'create wallet' do
      it 'should be valid with valid association' do
        user = create(:user)
        wallet = Wallet.new(balance: 0, number: 832093, is_default: 0, user: user)
        expect(wallet).to_not be_valid
      end

      it 'should be valid when all attributes are passed' do
        currency = create(:currency)
        user = create(:user)
        wallet = create(:wallet, user: user, currency: currency)

        expect(wallet).to be_valid
      end
    end
  end
end
