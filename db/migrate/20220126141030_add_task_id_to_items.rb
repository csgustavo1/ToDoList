class AddTaskIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :task_id, :integer
  end
end
