require 'rails_helper'

RSpec.describe 'User Story 1, City Index' do
  context 'As a visitor' do
    it 'I see the name of each city in the system' do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city1 = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)
      city2 = City.create!(name: "Paris", population: 7_000_000, technological_level: 8, inhabited: true, world_id: world.id)
      
      visit '/cities'
      expect(page).to have_content(city1.name)
      expect(page).to have_content(city2.name)
    end
  end
end
