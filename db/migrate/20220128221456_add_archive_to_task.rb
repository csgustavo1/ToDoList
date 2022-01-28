class AddArchiveToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :archive, :string
  end
end
