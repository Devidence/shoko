class AddStudentToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :student, index: true, foreign_key: true
  end
end
