class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true

      t.timestamps
    end
  end
end
