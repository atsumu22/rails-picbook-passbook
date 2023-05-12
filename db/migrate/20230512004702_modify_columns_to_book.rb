class ModifyColumnsToBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :published_at
    rename_column :books, :original_price, :price
    add_column :books, :image_url, :string
  end
end
