require 'rails_helper'

RSpec.describe Inhabitant, type: :model do
  it { should belong_to(:city) }
end
