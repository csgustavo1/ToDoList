require 'rails_helper'
require 'auth_helper'
include AuthHelper

RSpec.describe "Tasks", type: :request do
  include Devise::Test::IntegrationHelpers

    before(:each) do
      login_user
    end
 
    describe "GET /tasks" do
      it "checks if it will redirect to task#index" do
        get tasks_path
        expect(response).to have_http_status(200)
      end  
    end
     
    describe "POST /tasks" do
      it "checks if it will request POST params" do
        post "/tasks", :params => { :task => {:name => "My To do"} }
        expect(response.content_type).to eq("text/html")
        expect(response).to have_http_status(302)
      end
    end

    describe "POST /tasks" do
      it "does not create task" do
        expect {
          post tasks_path, :params => { :task => {:name => "", :teste => "1" } } }.to_not change(Task, :count)        
      end
    end
    

    describe "PUT /tasks" do
      it "checks if it will redirect to task#update" do
        task = Task.new
        task.name = "My To do"
        task.save
        put task_path(task.id), :params => { :task => {:name => "My To do 1"} }
        expect(response).to have_http_status(302)
      end
    end

    describe "DELETE /tasks" do
      it "checks if it will redirect to task#destroy" do
        task = Task.new
        task.name = "My To do"
        task.save
        delete task_path(task.id), :params => { :task => {:name => "My To do"} }
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /tasks" do
      it "checks if it will redirect to task#new" do
        get new_task_path
        expect(response).to have_http_status(200)
      end  
    end

    describe "GET /tasks" do
      it "checks if it will redirect to task#edit" do
        task = Task.new
        task.name = "My To do"
        task.save
        get edit_task_path(task.id)
        expect(response).to have_http_status(200)
      end  
    end

    describe "GET /tasks" do
      it "checks if it will redirect to task#show" do
        task = Task.new
        task.name = "My To do"
        task.save
        get task_path(task.id)
        expect(response).to have_http_status(200)
      end  
    end

end
