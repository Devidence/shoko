class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.references :skill, index: true, foreign_key: true
      t.references :mentor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
