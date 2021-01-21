FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { 'test' }
    last_name { 'test' }
    phone_number { '084982983' }
    password { 'rubyruby' }
  end
end
