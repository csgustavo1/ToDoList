require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe "GET /site" do
    it "checks if it will redirect to index" do
      get root_path
      expect(response).to have_http_status(200)
    end  
  end    
end
