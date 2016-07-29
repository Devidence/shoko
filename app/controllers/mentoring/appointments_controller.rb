class Mentoring::AppointmentsController < ApplicationController
  def index
    @appointments = current_mentor.appointments
  end

  def show
    # will show specific appointment of a student
    @student = Student.find(params[:student_id])
    @appointment = Appointment.find(params[:id])
    @questions = @appointment.questions
  end

  def new
    @appointment = Appointment.new
    @student = Student.find(params[:student_id])
  end
  
  def create
    @student = Student.find(params[:student_id])
    @appointment = Appointment.new
    @appointment.student = @student
    @appointment.mentor = current_mentor
    
    @appointment.save
    redirect_to mentoring_student_appointment_record_path(@student, @appointment)
  end
  
  def record
    @appointment = Appointment.find(params[:appointment_id])
    @student = Student.find(params[:student_id])
    @questions = @appointment.questions
  end
  
  def conclude
    @appointment = Appointment.find(params[:appointment_id])
    @student = Student.find(params[:student_id])
    
    @appointment.conclude
    
    redirect_to mentoring_students_path
  end
end
