require 'spec_helper'

module AuthHelper
 def login_user
  user = FactoryBot.create(:user)
  # user.confirm # or set a confirmed_at inside the factory. Only      necessary if you are using the "confirmable" module
  sign_in user
 end
end