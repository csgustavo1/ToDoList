require 'rails_helper'
require 'auth_helper'
include AuthHelper

describe "testing creation and editing of to do", type: :feature do
    include Devise::Test::IntegrationHelpers

    before(:each) do
        login_user
      end

    context "Create to do" do
        it "Add to to form" do
         tasks = Task.all
         size_old = tasks.size

            visit '/tasks/new'
             within("#task_form") do
              fill_in 'task[name]', with: 'My to do list'
              fill_in 'task[description]', with: 'Decricao da My to list'

              fill_in 'task[items_attributes][0][name]', with: 'Item 1 da My to list'
              
            end
              click_button 'commit'
              expect(page).to have_content 'Visualizando To Do'

              tasks = Task.all
              expect(tasks.size).to eql(size_old + 1)
        end

        it "Add to to form and edit to do list" do
            tasks = Task.all
            size_old = tasks.size
   
               visit '/tasks/new'
                within("#task_form") do
                 fill_in 'task[name]', with: 'My to do list'
                 fill_in 'task[description]', with: 'Decricao da My to list'
   
                 fill_in 'task[items_attributes][0][name]', with: 'Item 1 da My to list'
                 
               end
                 click_button 'commit'
                 expect(page).to have_content 'Visualizando To Do'
                 click_link 'show_back'

                 expect(page).to have_content 'To do List'

                 click_link 'edit_todo'

                 fill_in 'task[name]', with: 'My to do list editada'

                 click_button 'commit'

                 expect(page).to have_content 'Visualizando To Do'
                      
                 tasks = Task.all
                 expect(tasks.size).to eql(size_old + 1)
           end
    end  

end    