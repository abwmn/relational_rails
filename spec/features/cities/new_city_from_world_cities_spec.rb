require 'rails_helper'

RSpec.describe 'New City from World Cities page', type: :feature do
  it 'allows a user to create a new city associated with a specific world' do
    world = World.create(name: 'Test World', number_of_continents: 2, climate: 'Tropical', inhabitable: true)

    visit "/worlds/#{world.id}/world_cities"

    click_link 'New City'

    expect(current_path).to eq("/worlds/#{world.id}/world_cities/new")

    fill_in 'Name', with: 'New City'
    fill_in 'Population', with: 50000
    fill_in 'Technological level', with: 3
    check 'Inhabited'

    click_button 'Create City'

    expect(current_path).to eq("/worlds/#{world.id}/world_cities")
    expect(page).to have_content('New City')
  end
end
