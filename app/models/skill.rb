class Skill > ActiveRecord::Base
  belongs_to :mentor
  has_many   :bookmarks
end
