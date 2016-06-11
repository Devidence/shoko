require 'faker'

# Mentors
mentor = Mentor.new(
  email: "mentor@example.com",
  first_name: "Mentor",
  last_name: "Smith",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.now
)
mentor.save!

all_students = []

10.times do
  Student.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now,
    mentor: mentor
  )
end

all_students = Student.all

all_students.each do |student|
  Appointment.create!(
    mentor: mentor,
    student: student
  )
end

# Skills
10.times do
  Skill.create!(
    name: Faker::Lorem.sentence(2),
    description: Faker::Lorem.paragraph(2),
    mentor: mentor
  )
end


# Output
# For output, just add class that you seeded to the models Array
models = [Mentor, Student, Appointment, Skill]

models.each do |model|
  puts "#{model.count} #{model.to_s.pluralize} were created."
end
