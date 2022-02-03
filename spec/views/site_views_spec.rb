require 'rails_helper'

RSpec.describe Site::HomeController, type: :controller do
    render_views

    it "this route needs to render the index view" do
        get :index
        expect(response).to render_template("index") 
    end
   
end    