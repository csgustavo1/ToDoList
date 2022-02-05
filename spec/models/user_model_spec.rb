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

 context "Create and save user account" do
    it "tests if properties are being saved in the database" do
      user = User.new
      user.email = FFaker::Internet.email
      user.password = "helloword"
      user.password_confirmation =  "helloword"
      user.confirmed_at = Time.now 
      expect(user).to be_valid

      expect(user.save).to be true
    end 
  end

  context "Create and save user account password < min 6 lengths" do
    it "tests if properties are being not saved in the database" do
      user = User.new
      user.email = FFaker::Internet.email
      user.password = "hello"
      user.password_confirmation =  "hello"
      user.confirmed_at = Time.now 
      expect(user).to_not be_valid

      expect(user.save).to be false 
    end 
  end   


end
