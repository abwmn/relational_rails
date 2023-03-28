require 'rails_helper'

RSpec.describe City, type: :model do
  it { should belong_to(:world) }
  it { should have_many(:inhabitants).dependent(:destroy) }

  describe '#set_pop_zero_if_uninhabited' do
    it 'sets population to 0 if city is uninhabited' do
      city = City.create(name: 'City1', world: World.create(name: 'World1'), population: 2000, inhabited: false)
      city.reload
      expect(city.population).to eq(0)
    end

    it 'does not change population if city is inhabited' do
      city = City.create(name: 'City1', world: World.create(name: 'World1'), population: 2000, inhabited: true)
      city.reload
      expect(city.population).to eq(2000)
    end
  end
end
