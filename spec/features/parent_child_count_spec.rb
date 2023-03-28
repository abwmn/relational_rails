require 'rails_helper'

describe 'User Story 7, Parent Child Count' do
  context 'As a visitor' do
    it "I see a count of the number of children associated with this parent" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city1 = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)
      city2 = City.create!(name: "San Francisco", population: 883_000, technological_level: 9, inhabited: true, world_id: world.id)

      visit "/worlds/#{world.id}"
      expect(page).to have_content("Number of cities: #{world.cities.count}")

      visit "/cities/#{city1.id}"
      expect(page).to have_content("Number of inhabitants: #{city1.inhabitants.count}")
    end
  end
end