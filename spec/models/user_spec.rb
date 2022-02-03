require 'rails_helper'

RSpec.describe User, type: :model do
  it "test the user instance" do
    expect(User.new).to be_present
  end

  it "tests the properties" do
    user = User.new
    expect(user.respond_to?(:email)).to be true
    expect(user.respond_to?(:encrypted_password)).to be true
    expect(user.respond_to?(:reset_password_token)).to be true
    expect(user.respond_to?(:remember_created_at)).to be true
    expect(user.respond_to?(:created_at)).to be true
    expect(user.respond_to?(:updated_at)).to be true
    expect(user.respond_to?(:confirmation_token)).to be true
    expect(user.respond_to?(:confirmed_at)).to be true
    expect(user.respond_to?(:confirmation_sent_at)).to be true
    expect(user.respond_to?(:unconfirmed_email)).to be true
  end
  
end
