require 'rails_helper'

RSpec.describe "Inhabitants Index", type: :feature do
  context 'As a visitor' do
    let!(:world) { World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)}
    let!(:city1) {City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)}
    let!(:city2) {City.create!(name: "San Francisco", population: 883_000, technological_level: 9, inhabited: true, world_id: world.id)}
    let!(:inhabitant1){Inhabitant.create!(name: "John Doe", age: 30, married: true, role: "Engineer", city_id: city1.id)}
    let!(:inhabitant2){Inhabitant.create!(name: "Jane Doe", age: 29, married: true, role: "Doctor", city_id: city1.id)}

    it "User Story 5, Parent Children Index: I see each Child that is associated with that Parent with each Child's attributes" do
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

    it "User Story 15: Only displays inhabitants with married set to true" do
      married_inhabitant = Inhabitant.create!(name: "Married Inhabitant", age: 30, married: true, city_id: city1.id)
      unmarried_inhabitant = Inhabitant.create!(name: "Unmarried Inhabitant", age: 25, married: false, city_id: city1.id)

      visit inhabitants_path

      within('ul') do
        expect(page).to have_content(married_inhabitant.name)
        expect(page).not_to have_content(unmarried_inhabitant.name)
      end
    end

    it "User Story 16: Sort inhabitants in alphabetical order by name" do
      visit inhabitants_path
    
      click_link 'Sort by Name'
    
      expect(page).to have_selector("ul div:nth-child(1) h3", text: inhabitant2.name)
      expect(page).to have_selector("ul div:nth-child(2) h3", text: inhabitant1.name)
    end
    

    it "User Story 18: Child Update From Childs Index Page - Inhabitants" do
      visit inhabitants_path
    
      within "#inhabitant-#{inhabitant1.id}" do
        click_link 'Edit Inhabitant'
      end
    
      expect(current_path).to eq(edit_inhabitant_path(inhabitant1))
    end

    it "User Story 20: deletes an inhabitant and redirects to the inhabitants index page" do
      visit inhabitant_path(inhabitant1)
      click_link "Delete Inhabitant"
  
      expect(current_path).to eq(inhabitants_path)
      expect(page).not_to have_content(inhabitant1.name)
    end
  end
end