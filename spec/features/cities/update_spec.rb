require 'rails_helper'

RSpec.describe 'Cities update page', type: :feature do
  before :each do
    @world = World.create!(name: 'World1', id: 1, number_of_continents: 5, inhabitable: true)
    @city = City.create!(name: 'City1', world_id: 1, population: 1000, technological_level: 2, inhabited: true)
    @inhabitant = @city.inhabitants.create!(name: 'Inhabitant1', age: 30, role: 'Worker', married: true)
  end

  it 'allows updating a city' do
    visit city_path(@city)

    click_on 'Update City'

    fill_in 'Name', with: 'Updated City'
    click_on 'Update City'

    expect(current_path).to eq(city_path(@city))
    expect(page).to have_content('Updated City')
  end
end