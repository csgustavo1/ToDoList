require 'rails_helper'
require 'capybara/rails'

RSpec.describe Task, type: :model do
  it "test the task instance" do
     expect(Task.new).to be_present
  end

  it "tests the properties" do
    task = Task.new
    expect(task.respond_to?(:name)).to be true
    expect(task.respond_to?(:description)).to be true
    expect(task.respond_to?(:priority)).to be true
    expect(task.respond_to?(:date)).to be true
    expect(task.respond_to?(:category)).to be true
    expect(task.respond_to?(:completed)).to be true
  end  

  it "tests if properties are being saved in the database" do
    task = Task.new
    task.name = FFaker::Lorem.characters
    task.description = FFaker::Lorem.characters
    task.priority = FFaker::Random.rand(0...2)
    task.category = FFaker::Random.rand(0...4)
    task.completed = true
    task.date = FFaker::IdentificationESCO.expedition_date

    expect(task).to be_valid

    expect(task.save).to be true
  end

  it "tests if properties are being not saved in the database" do
    task = Task.new
    task.name = nil
    task.description = FFaker::Lorem.characters
    task.priority = FFaker::Random.rand(0...2)
    task.category = FFaker::Random.rand(0...4)
    task.completed = true
    task.date = FFaker::IdentificationESCO.expedition_date

    expect(task).to_not be_valid

    expect(task.save).to be false
  end
  
  it "tests if properties are being search in the database" do
    task = Task.new
    task.name = FFaker::Lorem.characters
    task.description = FFaker::Lorem.characters
    task.priority = FFaker::Random.rand(0...2)
    task.category = FFaker::Random.rand(0...4)
    task.completed = true
    task.date = FFaker::IdentificationESCO.expedition_date

    expect(task).to be_valid

    task.save 

    c2 = Task.find(task.id)
    c2.name = "testando update"
    expect(c2.save).to be true

    expect(Task.where(name: "testando update").count > 0 ).to be true
  end 

  it "tests if properties are being deleted in the database" do
    task = Task.new
    task.name = "nome teste"
    task.description = FFaker::Lorem.characters
    task.priority = FFaker::Random.rand(0...2)
    task.category = FFaker::Random.rand(0...4)
    task.completed = true
    task.date = FFaker::IdentificationESCO.expedition_date

    expect(task).to be_valid

    task.save 

    expect(Task.where(name: "nome teste").count > 0 ).to be true

    task.destroy

    expect(Task.where(name: "nome teste").count == 0 ).to be true

  end
  
  describe Task do
    context "associations" do
      it "has many tasks to items" do 
        should respond_to(:items)
      end
    end   
  end

end
