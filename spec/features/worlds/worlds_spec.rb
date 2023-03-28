require 'rails_helper'

RSpec.describe "Worlds Index", type: :feature do
  context 'As a visitor' do
    let!(:world1) {World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)}
    let!(:world2) {World.create!(name: "Mars", number_of_continents: 1, climate: "barren", inhabitable: false)}
    it 'User Story 1, World Index: I see the name of each world in the system' do

      visit '/worlds'
      expect(page).to have_content(world1.name)
      expect(page).to have_content(world2.name)
    end

    it "User Story 17: Parent Update From Parent Index Page" do
      visit worlds_path
    
      within "#world-#{world1.id}" do
        click_link 'Edit World'
      end
    
      expect(current_path).to eq(edit_world_path(world1))
    end    

    it "User Story 19: deletes a world and redirects to the worlds index page" do
      visit world_path(world1)
      click_link "Delete World"
  
      expect(current_path).to eq(worlds_path)
      expect(page).not_to have_content(world1.name)
    end

    it "User Story 22: Parent Delete From Parent Index Page - Worlds" do
      world1 = World.create!(name: "World1", number_of_continents: 5, climate: "temperate", inhabitable: true)
    
      visit worlds_path
    
      within("#world-#{world1.id}") do
        click_link 'Delete'
      end
    
      expect(current_path).to eq(worlds_path)
      expect(page).not_to have_content(world1.name)
    end
  end
end