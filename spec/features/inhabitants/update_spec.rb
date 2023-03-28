require 'rails_helper'

RSpec.describe 'Inhabitants update page', type: :feature do
  before :each do
    @world = World.create!(name: 'World1', id: 1, number_of_continents: 5, inhabitable: true)
    @city = City.create!(name: 'City1', world_id: 1, population: 1000, technological_level: 2, inhabited: true)
    @inhabitant = @city.inhabitants.create!(name: 'Inhabitant1', age: 30, role: 'Worker', married: true)
  end

  it 'allows updating an inhabitant' do
    visit inhabitant_path(@inhabitant)

    click_on 'Update Inhabitant'

    fill_in 'Name', with: 'Updated Inhabitant'
    click_on 'Update Inhabitant'

    expect(current_path).to eq(inhabitant_path(@inhabitant))
    expect(page).to have_content('Updated Inhabitant')
  end
end