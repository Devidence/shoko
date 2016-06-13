class StudentsController < ApplicationController
  def index
    @students = current_mentor.students
  end
end
