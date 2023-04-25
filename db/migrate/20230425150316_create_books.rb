class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.time :year
      t.string :publisher
      t.integer :original_price

      t.timestamps
    end
  end
end
