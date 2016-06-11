class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :appointment, index: true, foreign_key: true
      t.string :description
      t.string :answer

      t.timestamps null: false
    end
  end
end
