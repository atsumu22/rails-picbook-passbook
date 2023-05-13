class ModifyTableAndColumns < ActiveRecord::Migration[7.0]
  def change
    drop_table :bookmarks
    add_column :logs, :status, :integer
  end
end
