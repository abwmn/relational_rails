module Generator
  CLIMATES = %w[
    tropical
    arid
    temperate
    continental
    polar
    alpine
    subtropical
    mediterranean
    oceanic
    tundra
    desert
    rainforest
    taiga
    savannah
    monsoon
    gaseous
    volcanic
    diverse
  ]
  
  def generate_climate
    CLIMATES.sample
  end
  
  def generate_world_name
    prefix = Faker::Lorem.word.capitalize
    suffix = %w(Prime Major Minor Terra Alpha Beta Gamma Delta).sample
    "#{prefix}-#{suffix}"
  end

  def generate_earth_city_name
    Faker::Address.city
  end

  def generate_alien_city_name
    prefix = Faker::Space.galaxy.capitalize
    suffix = %w(Prime Major Minor Terra Alpha Beta Gamma Delta).sample
    "#{prefix}-#{suffix}"
  end

  def generate_earth_inhabitant_name
    Faker::Name.name
  end

  def generate_alien_inhabitant_name
    prefix = Faker::Games::DnD.race
    suffix = Faker::Creature::Animal.name.capitalize
    "#{prefix} #{suffix}"
  end

  def generate_world
    world = World.create!(
      name: generate_world_name,
      climate: generate_climate,
      number_of_continents: rand(0..9),
      inhabitable: true
    )
    generate_cities(world, rand(1..4))
    flash[:success] = "A new world with cities and inhabitants has been generated!"
    redirect_to worlds_path
  end

  def generate_cities(world, count)
    count.times do
      city = City.create!(
        name: world.name == 'Earth' ? generate_earth_city_name : generate_alien_city_name,
        population: rand(42000..42000000),
        world_id: world.id,
        inhabited: true
      )
      generate_inhabitants(city, rand(111..333))
    end
  end

  def generate_inhabitants(city, count)
    count.times do
      Inhabitant.create!(
        name: city.world.name == 'Earth' ? generate_earth_inhabitant_name : generate_alien_inhabitant_name,
        age: rand(1..100),
        married: [true, false].sample,
        role: Faker::Job.title,
        city_id: city.id
      )
    end
  end
end
