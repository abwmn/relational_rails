require 'rails_helper'

describe 'User Story 9, Parent Index Link' do
  context 'As a visitor' do
    it "I see a link at the top of the page that takes me to the Parent Index" do
      world = World.create!(name: "Earth", number_of_continents: 7, climate: "diverse", inhabitable: true)

      visit '/worlds'
      click_link 'Worlds'
      expect(current_path).to eq('/worlds')

      visit "/worlds/#{world.id}"
      click_link 'Worlds'
      expect(current_path).to eq('/worlds')
    end
  end
end