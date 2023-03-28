require 'rails_helper'

describe 'User Story 4, Inhabitant Show' do
  context 'As a visitor' do
    it "I see the child with that id including the child's attributes" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)
      inhabitant = Inhabitant.create!(name: "John Doe", age: 30, married: false, role: "Engineer", city_id: city.id)

      visit "/inhabitants/#{inhabitant.id}"
      expect(page).to have_content(inhabitant.name)
      expect(page).to have_content(inhabitant.age)
      expect(page).to have_content(inhabitant.married)
      expect(page).to have_content(inhabitant.role)
    end
  end
end