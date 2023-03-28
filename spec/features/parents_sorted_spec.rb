require 'rails_helper'

describe 'User Story 6, Parent Index sorted by Most Recently Created' do
  context 'As a visitor' do
    it "I see that records are ordered by most recently created first and next to each of the records I see when it was created" do
      world1 = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true, created_at: 1.day.ago)
      world2 = World.create!(name: "Mars", number_of_continents: 0, climate: "arid", inhabitable: false)

      visit "/worlds"
      expect(world2.name).to appear_before(world1.name)
      expect(page).to have_content(world1.created_at.to_s(:long))
      expect(page).to have_content(world2.created_at.to_s(:long))

      city1 = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world1.id, created_at: 1.day.ago)
      city2 = City.create!(name: "San Francisco", population: 883_000, technological_level: 9, inhabited: true, world_id: world1.id)

      visit "/cities"
      expect(city2.name).to appear_before(city1.name)
      expect(page).to have_content(city1.created_at.to_s(:long))
      expect(page).to have_content(city2.created_at.to_s(:long))
    end
  end
end