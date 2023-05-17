class AddColumnToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :status, :integer
    add_reference :books, :user, foreign_key: true
  end
end
