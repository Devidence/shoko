class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.text :description
      t.references :mentor, index: true, foreign_key: true
    end
  end
end
