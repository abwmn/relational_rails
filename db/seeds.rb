# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
World.destroy_all
City.destroy_all
Inhabitant.destroy_all

world1 = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
world2 = World.create!(name: "Mars", number_of_continents: 0, climate: "arid", inhabitable: false)

city1 = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world1.id)
city2 = City.create!(name: "San Francisco", population: 883_305, technological_level: 9, inhabited: true, world_id: world1.id)

inhabitant1 = Inhabitant.create!(name: "John Doe", age: 30, married: false, role: "Engineer", city_id: city1.id)
inhabitant2 = Inhabitant.create!(name: "Jane Doe", age: 28, married: true, role: "Doctor", city_id: city1.id)
