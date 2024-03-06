# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "----STARTS SEED DATA----"

Booking.create( first_name: 'John',
                last_name: 'Smith',
                animal_name: 'Rufus',
                animal_type: 'dog',
                hours_requested: 2,
                date_of_service: '03-04-2024')
puts "Created booking"

Booking.create( first_name: 'Jane',
                last_name: 'Doe',
                animal_name: 'mittens',
                animal_type: 'cat',
                hours_requested: 4,
                date_of_service: '03-07-2024')
puts "Created booking"

Booking.create( first_name: 'Sam',
                last_name: 'Doe',
                animal_name: 'wiskers',
                animal_type: 'cat',
                hours_requested: 7,
                date_of_service: '03-11-2024')
puts "Created booking"

Booking.create( first_name: 'Sally',
                last_name: 'Smith',
                animal_name: 'rascal',
                animal_type: 'dog',
                hours_requested: 3,
                date_of_service: '03-05-2024')
puts "Created booking"

puts "----FINISHES SEED DATA----"