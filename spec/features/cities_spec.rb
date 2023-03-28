require 'rails_helper'

RSpec.describe "Cities Index", type: :feature do
  context "As a visitor" do
    let!(:world){World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)}
    let!(:city1){City.create!(name: "New York City", population: 8_000_000, technological_level: 8, inhabited: true, world_id: world.id)}
    let!(:city2){City.create!(name: "Paris", population: 7_000_000, technological_level: 8, inhabited: true, world_id: world.id)}
    it "User Story 1: I see the name of each city in the system" do
      visit '/cities'
      expect(page).to have_content(city1.name)
      expect(page).to have_content(city2.name)
    end

    it "User Story 15: Only displays inhabited cities" do
      inhabited_city = City.create!(name: "Test City 1", population: 1000, inhabited: true, world_id: world.id)
      uninhabited_city = City.create!(name: "Test City 2", population: 2000, inhabited: false, world_id: world.id)

      visit cities_path

      within('ul') do
        expect(page).to have_content(inhabited_city.name)
        expect(page).not_to have_content(uninhabited_city.name)
      end
    end

    it "User Story 16: Sort cities in alphabetical order by name" do
      visit cities_path

      click_link 'Sort by Name'

      expect(page).to have_selector("ul div:contains('#{city1.name}')")
      expect(page).to have_selector("ul div:contains('#{city2.name}')")
    end

    it "User Story 18: Child Update From Childs Index Page - Cities" do
      visit cities_path
    
      within "#city-#{city1.id}" do
        click_link 'Edit City'
      end
    
      expect(current_path).to eq(edit_city_path(city1))
    end

    it "User Story 20: deletes a city and redirects to the cities index page" do
      visit city_path(city1)
      click_link "Delete City"
  
      expect(current_path).to eq(cities_path)
      expect(page).not_to have_content(city1.name)
    end
  end
end
