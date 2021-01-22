FactoryBot.define do
  factory :wallet do
    balance { 0 }
    is_default { 0 }
    user
  end
end
