require 'rails_helper'
require 'auth_helper'
include AuthHelper

RSpec.describe TasksController, type: :controller do
    include Devise::Test::IntegrationHelpers

    render_views

    before(:each) do
      login_user
    end

    it "this route needs to render the index view" do
        get :index
        expect(response).to render_template("index") 
    end

    it "this route needs to render the new view" do
        get :new
        expect(response).to render_template("new") 
    end
    
    it "checks if the code has been entered on the page" do
      get :index 

      puts '============='
      puts response.body
      puts '============='

      expect(response.body).to match /<h4>.*?To do List.*?<\/h4>/im
    end
    
end    