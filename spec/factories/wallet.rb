FactoryBot.define do
  factory :wallet do
    balance { 0 }
    number { 1_001_234 }
    is_default { 0 }
    user
  end
end
