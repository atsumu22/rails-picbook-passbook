class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.datetime :published_at
      t.string :publisher
      t.integer :original_price

      t.timestamps
    end
  end
end
