class Mentor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :skills
  has_many :students
  has_many :bookmarks
  has_many :appointments

  before_create :set_mentor_role

  def set_mentor_role
    self.role = "mentor"
  end

end
