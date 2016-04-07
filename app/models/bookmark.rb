class Bookmark < ActiveRecord::Base
  belongs_to :skill
  belongs_to :mentor
end
