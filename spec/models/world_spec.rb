require 'rails_helper'

RSpec.describe World, type: :model do
  it { should have_many(:cities).dependent(:destroy) }
end
