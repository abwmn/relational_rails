require 'rails_helper'

RSpec.describe 'New City', type: :feature do
  describe 'As a visitor' do
    it 'I can create a new city' do
      world = World.create!(name: 'Earth', number_of_continents: 7, climate: 'Temperate', inhabitable: true)
      
      visit cities_path
      click_link 'New City'

      expect(current_path).to eq(new_city_path)

      fill_in 'Name', with: 'New City'
      select 'Earth', from: 'World'
      fill_in 'Population', with: 8500000
      fill_in 'Technological level', with: 8
      check 'Inhabited'

      click_button 'Create City'

      expect(current_path).to eq(cities_path)
      expect(page).to have_content('New City')
    end
  end
end