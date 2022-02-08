class AddToImageTask < ActiveRecord::Migration[5.2]
  def change
    unless column_exists?(:tasks, :image)
      add_column :tasks, :image, :string 
    end  
  end
end
