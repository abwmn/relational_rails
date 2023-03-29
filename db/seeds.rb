# db/seeds.rb
include Generator
World.destroy_all
City.destroy_all
Inhabitant.destroy_all

mercury = World.create!(name: "Mercury", number_of_continents: 0, climate: "arid", inhabitable: false)
venus = World.create!(name: "Venus", number_of_continents: 0, climate: "gaseous", inhabitable: false)
earth = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
mars = World.create!(name: "Mars", number_of_continents: 0, climate: "arid", inhabitable: false)

earth_cities = ["New York City", "London", "Tokyo", "Paris", "Istanbul"]
earth_cities.each do |city_name|
  city = City.create!(
    name: city_name,
    population: rand(6000000..9000000),
    technological_level: rand(6..9)
    world_id: earth.id,
    inhabited: true
  )
  Generator.generate_inhabitants(city, rand(111..333))
end

3.times do
  world = World.create!(
    name: Generator.generate_world_name,
    climate: Generator.generate_climate,
    number_of_continents: rand(0..99),
    inhabitable: true
  )
  Generator.generate_cities(world, rand(1..4))
end
