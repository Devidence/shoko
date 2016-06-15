class AppointmentsController < ApplicationController

  def index
    # will show all appointments based on a student
    @appointments = Appointment.where(student_id: params[:student_id])
  end

  def show
    # will show specific appointment of a student
    @appointment = Appointment.find(params[:id])
    @questions = Question.where(appointment: @appointment)
  end

  def new
    @appointment = Appointment.new
    @appointment.mentor = current_mentor
    @appointment.student = Student.find(params[:student_id])
    @appointment.save
  end


end
