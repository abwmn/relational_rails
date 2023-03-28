require 'rails_helper'

RSpec.describe "Worlds Index", type: :feature do
  context 'As a visitor' do
    it 'User Story 1, World Index: I see the name of each world in the system' do
      world1 = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      world2 = World.create!(name: "Mars", number_of_continents: 1, climate: "barren", inhabitable: false)

      visit '/worlds'
      expect(page).to have_content(world1.name)
      expect(page).to have_content(world2.name)
    end

    it "User Story 17: Parent Update From Parent Index Page" do
      world = World.create!(name: "World A")
    
      visit worlds_path
    
      within "#world-#{world.id}" do
        click_link 'Edit World'
      end
    
      expect(current_path).to eq(edit_world_path(world))
    end    
  end
end