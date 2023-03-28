require 'rails_helper'

describe 'User Story 9, Parent Index Link' do
  context 'As a visitor' do
    it "I see a link at the top of the page that takes me to the Parent Index" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)

      visit '/worlds'
      click_link 'Worlds'
      expect(current_path).to eq('/worlds')

      visit "/worlds/#{world.id}"
      click_link 'Worlds'
      expect(current_path).to eq('/worlds')

      visit '/cities'
      click_link 'Cities'
      expect(current_path).to eq('/cities')

      visit "/cities/#{city.id}"
      click_link 'Cities'
      expect(current_path).to eq('/cities')
    end
  end
end