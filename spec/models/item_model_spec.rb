require 'rails_helper'

RSpec.describe Item, type: :model do
  it "test the item instance" do
    expect(Item.new).to be_present
  end
  
  it "tests the properties" do
    item = Item.new
    expect(item.respond_to?(:id)).to be true
    expect(item.respond_to?(:task_id)).to be true
    expect(item.respond_to?(:name)).to be true
    expect(item.respond_to?(:priority)).to be true
    expect(item.respond_to?(:date)).to be true
    expect(item.respond_to?(:completed)).to be true
  end

  context "an item cannot be saved without a task" do
    it "tests if properties are being not saved in the database" do
      item = Item.new
      item.name = FFaker::Lorem.characters
      item.priority = FFaker::Random.rand(0...2)
      item.completed = true
      item.date = FFaker::IdentificationESCO.expedition_date
      expect(item).to_not be_valid

      expect(item.save).to be false 
    end 
  end
  

  describe Item do
    context "associations" do
      it "items to tasks" do 
        should respond_to(:task)
      end
    end   
  end
  
end
