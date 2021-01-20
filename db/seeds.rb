currencies = [
  ['US Dollar', '$', 'USD', 1],
  %w[NAIRA ₦ NGR 0.75],
  %w[BITCOIN ₿ BTC 0.000029]
]

currencies.each do |name, symbol, code, rate|
  Currency.find_or_create_by!(name: name, symbol: symbol, code: code, rate: rate)
end
