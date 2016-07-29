class Appointment < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :student
  has_many :questions, dependent: :destroy
  
  def conclude
    self.finished_at = Time.now
    save
  end
end
