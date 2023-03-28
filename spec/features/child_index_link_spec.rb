require 'rails_helper'

describe 'User Story 8, Child Index Link' do
  context 'As a visitor' do
    it "I see a link at the top of the page that takes me to the Child Index" do
      visit worlds_path

      click_link 'Inhabitants Index'
      expect(current_path).to eq(inhabitants_path)

      visit cities_path

      click_link 'Inhabitants Index'
      expect(current_path).to eq(inhabitants_path)
    end
  end
end