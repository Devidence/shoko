class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :mentor
  
  has_many :appointments

  before_create :set_student_role

  def set_student_role
    self.role = "student"
  end
  
  def name
    "#{first_name} #{last_name}"
  end
end
