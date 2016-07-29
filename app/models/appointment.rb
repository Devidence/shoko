class Appointment < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :student
  has_many :questions, dependent: :destroy
  
  enum catgegory: [ :scheduled, :make_up, :impromptu ]
  
  def conclude
    self.finished_at = Time.now
    save
  end
end
