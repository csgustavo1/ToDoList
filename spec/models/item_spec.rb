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
  
  # it "tests if properties are being saved in the database" do
  #    task = Task.new(name: "testando", [Item.new(name: "teste")])

  #   expect(task.save).to be true
  # end

  # it "tests if properties are being saved in the database" do
  #   item = Item.new
  #   item.name = "nome teste"
  #   item.task_id =  1
  #   item.priority = 0
  #   item.completed = true
  #   item.date = DateTime.current.to_date

  #   item.save

  #   c2 = Item.find(item.id)
  #   c2.name = "testando update"
  #   expect(c2.save).to be true

  #   expect(Item.where(name: "testando update").count > 0 ).to be true
  # end

  # it "tests if properties are being saved in the database" do
  #   item = Item.new
  #   item.name = "nome teste"
  #   item.priority = 0
  #   item.task_id =  1
  #   item.completed = true
  #   item.date = DateTime.current.to_date

  #   item.save

  #   expect(Item.where(name: "nome teste").count > 0 ).to be true

  #   item.destroy

  #   expect(Item.where(name: "nome teste").count == 0 ).to be true

  # end  
end
