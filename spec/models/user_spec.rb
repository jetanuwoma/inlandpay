require 'rails_helper'

RSpec.describe User, type: :model do
   subject { described_class.new }

  it "is valid with valid attributes" do
    subject.email = "test@ty.com"
    subject.password = "password"
    expect(subject).to be_valid 
  end

  it "is not valid without email and password" do
    expect(subject).to_not be_valid
  end
end
