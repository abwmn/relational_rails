class City < ApplicationRecord
  belongs_to :world
  has_many :inhabitants
end
