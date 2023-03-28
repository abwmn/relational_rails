class World < ApplicationRecord
  has_many :cities, dependent: :destroy
end
