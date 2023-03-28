require 'rails_helper'

RSpec.describe 'New World', type: :feature do
  describe 'As a visitor' do
    it 'I can create a new world' do
      
      visit worlds_path
      click_link 'Custom, Empty New World'

      expect(current_path).to eq(new_world_path)

      fill_in 'Name', with: 'Venus'
      fill_in 'Number of continents', with: 0
      fill_in 'Climate', with: 'gaseous'


      click_button 'World'

      expect(current_path).to eq(worlds_path)
      expect(page).to have_content('Venus')
    end
  end
end