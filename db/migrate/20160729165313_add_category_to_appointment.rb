class AddCategoryToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :category, :integer, default: 1
  end
end
