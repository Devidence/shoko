class AddFinishedAtToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :finished_at, :datetime
  end
end
