class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :approved_at, :datetime
    add_reference :students, :mentor, index: true, foreign_key: true
  end
end
