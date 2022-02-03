require 'rails_helper'
require 'auth_helper'
include AuthHelper

RSpec.describe "Tasks", type: :request do
  include Devise::Test::IntegrationHelpers

    before(:each) do
      login_user
    end
 
    describe "GET /tasks" do
      it "checks if it will redirect to authentication" do
        get tasks_path
        expect(response).to have_http_status(200)
      end  
    end

    # describe "POST /tasks" do
    #   context "when it has valid parameters" do 
    #     it "creates the task with correct attributes" do
    #       task = build(:task)
    #       post tasks_path, task: FactoryBot.attributes_for(task)
    #       expect(Task.last).to have_attributes(task)
    #     end  
    #   end  
    # end  


end
