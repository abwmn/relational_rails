require 'rails_helper'

RSpec.describe "Cities Index", type: :feature do
  context "As a visitor" do
    it "User Story 1: I see the name of each city in the system" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city1 = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)
      city2 = City.create!(name: "Paris", population: 7_000_000, technological_level: 8, inhabited: true, world_id: world.id)
      
      visit '/cities'
      expect(page).to have_content(city1.name)
      expect(page).to have_content(city2.name)
    end
  end

  it "User Story 15: Only displays inhabited cities" do
    world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
    inhabited_city = City.create!(name: "Test City 1", population: 1000, inhabited: true, world_id: world.id)
    uninhabited_city = City.create!(name: "Test City 2", population: 2000, inhabited: false, world_id: world.id)

    visit cities_path

    within('ul') do
      expect(page).to have_content(inhabited_city.name)
      expect(page).not_to have_content(uninhabited_city.name)
    end
  end

  it "User Story 16: Sort cities in alphabetical order by name" do
    world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
    city1 = City.create!(name: "City A", population: 1000, inhabited: true, world_id: world.id)
    city2 = City.create!(name: "City B", population: 2000, inhabited: true, world_id: world.id)

    visit cities_path

    click_link 'Sort by Name'

    expect(page).to have_selector("ul h3:nth-of-type(1)", text: city1.name)
    expect(page).to have_selector("ul h3:nth-of-type(2)", text: city2.name)
  end
end
