require 'rails_helper'

describe 'User Story 4, Inhabitant Show' do
  context 'As a visitor' do
    it "I see the child with that id including the child's attributes" do
      city = City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true)
      inhabitant = Inhabitant.create!(name: "John Doe", age: 30, married: false, role: "Engineer", city_id: city.id)

      visit "/inhabitants/#{inhabitant.id}"
      expect(page).to have_content(inhabitant.name)
      expect(page).to have_content(inhabitant.age)
      expect(page).to have_content(inhabitant.married)
      expect(page).to have_content(inhabitant.role)
    end
  end
end