module ApplicationHelper
  def current_user
    # Will need a more robust solution, at some point.
    current_mentor || current_student
  end
end
