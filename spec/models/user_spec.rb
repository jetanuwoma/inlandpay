require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      email: 'test@gmail.com',
      first_name: 'test',
      last_name: 'test',
      phone_number: '07032776995',
      password: 'testty'
    )
    expect(user).to be_valid
  end

  it 'should not be valid when password lenght is less than 6' do
    user = User.new(
      email: 'test@gmail.com',
      first_name: 'test',
      last_name: 'test',
      phone_number: '07032776995',
      password: 'test'
    )
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end
end
