class ChangeColumnDateToTask < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :date, :date
  end
end
