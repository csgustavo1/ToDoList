require 'rails_helper'
RSpec.describe Site::HomeController, type: :controller do
    render_views

    it "this route needs to render the index view" do
        get :index
        expect(response).to render_template("index") 
    end

    it "checks if the code has been entered on the page" do
        get :index
    
        puts '============='
        puts response.body
        puts '============='
    
        expect(response.body).to match /<h2.*?Seja bem-vindo!.*?<\/h2>/im
    end
   
end    