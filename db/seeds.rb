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
models = [Mentor, Skill]

models.each do |model|
  puts "#{model.count} #{model.to_s.pluralize} were created."
end
