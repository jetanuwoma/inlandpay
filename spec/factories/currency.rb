FactoryBot.define do
  factory :currency do
    name { 'US Dollar' }
    code { 'USD' }
    symbol { '$' }
    rate  { 1 }
  end
end
