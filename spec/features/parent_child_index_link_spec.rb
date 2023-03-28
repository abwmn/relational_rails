require 'rails_helper'

describe 'User Story 10, Parent Child Index Link' do
  context 'As a visitor' do
    it "I see a link to take me to that parent's child_table_name page" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)

      visit "/worlds/#{world.id}"
      click_link "Show Cities"
      expect(current_path).to eq("/worlds/#{world.id}/world_cities")

      visit "/cities/#{city.id}"
      click_link "Show Inhabitant Portraits"
      expect(current_path).to eq("/cities/#{city.id}/city_inhabitants")
    end
  end
end