# spec/features/parent_index_spec.rb
require 'rails_helper'

describe 'User Story 1, World Index' do
  context 'As a visitor' do
    it 'I see the name of each world in the system' do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)
      world = World.create!(name: "Mars", number_of_continents: 1, climate: "barren", inhabitable: false)

      visit '/worlds'
      expect(page).to have_content(world1.name)
      expect(page).to have_content(world2.name)
    end
  end
end