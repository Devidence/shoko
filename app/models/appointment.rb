class Appointment < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :student
  has_many :questions, dependent: :destroy
end
