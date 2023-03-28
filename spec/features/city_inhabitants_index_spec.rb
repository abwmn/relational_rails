require 'rails_helper'

describe 'User Story 5, Parent Children Index' do
  context 'As a visitor' do
    it "I see each Child that is associated with that Parent with each Child's attributes" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      city1 = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)
      city2 = City.create!(name: "San Francisco", population: 883_000, technological_level: 9, inhabited: true, world_id: world.id)
      inhabitant1 = Inhabitant.create!(name: "John Doe", age: 30, married: false, role: "Engineer", city_id: city1.id)
      inhabitant2 = Inhabitant.create!(name: "Jane Doe", age: 29, married: false, role: "Doctor", city_id: city1.id)

      visit "/cities/#{city1.id}/city_inhabitants"
      expect(page).to have_content(inhabitant1.name)
      expect(page).to have_content(inhabitant1.age)
      expect(page).to have_content(inhabitant1.married)
      expect(page).to have_content(inhabitant1.role)

      expect(page).to have_content(inhabitant2.name)
      expect(page).to have_content(inhabitant2.age)
      expect(page).to have_content(inhabitant2.married)
      expect(page).to have_content(inhabitant2.role)
    end
  end
end