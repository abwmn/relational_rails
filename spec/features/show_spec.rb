require 'rails_helper'

describe 'User Story 2, Parent Show' do
  context 'As a visitor' do
    it "I see the parent with that id including the parent's attributes" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)

      visit "/worlds/#{world.id}"
      expect(page).to have_content(world.name)
      expect(page).to have_content(world.number_of_continents)
      expect(page).to have_content(world.climate)
      expect(page).to have_content(world.inhabitable)

      visit "/cities/#{city.id}"
      expect(page).to have_content(city.name)
      expect(page).to have_content(city.population)
      expect(page).to have_content(city.technological_level)
      expect(page).to have_content(city.inhabited)
    end
  end
end