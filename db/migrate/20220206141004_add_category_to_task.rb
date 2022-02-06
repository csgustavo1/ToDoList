class AddCategoryToTask < ActiveRecord::Migration[5.2]
  def change
    unless column_exists?(:tasks, :category)
      add_column :tasks, :category, :integer, default: 0 
    end  
  end
end
