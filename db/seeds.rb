# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  Employee.create(
                  email: "employee#{n}@test.com", password: "password"
                )
end

rand(1..10).times do |n|
  Kudo.create!(
              title: "Random title no #{n}", 
              content: "Random content no #{n}", 
              giver_id: rand(1..5), 
              receiver_id: rand(1..5)
            )
end

