require 'rails_helper'

RSpec.describe Currency, type: :model do
  context 'validation' do
    it 'should be valid with valid attributes' do
      currency = create(:currency)
      expect(currency).to be_valid
    end
  end

  context 'association' do
    before(:each) do
      @currency = create(:currency)

      @wallet_one = create(:wallet, balance: 200, currency: @currency)
      @wallet_two = create(:wallet, balance: 300, currency: @currency)
    end

    it 'should have many wallets' do
      expect(@currency.wallets.size).to be(2)
      expect(@currency.wallets.first.balance).to eq(200)
    end
  end

  describe '#code_to_symbol' do
    before(:each) do
      create(:currency, code: 'USD', symbol: '$')
    end

    it 'should convert code to symbol' do
      usd = Currency.code_to_symbol('USD')
      expect(usd).to eq('$')
    end
  end
end
