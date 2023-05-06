class ModifyTableLogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :name, :title
    remove_column :logs, :price
  end
end
