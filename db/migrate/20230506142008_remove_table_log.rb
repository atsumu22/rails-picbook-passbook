class RemoveTableLog < ActiveRecord::Migration[7.0]
  def change
    remove_column :logs, :comment
  end
end
