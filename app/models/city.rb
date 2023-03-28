class City < ApplicationRecord
  belongs_to :world
  has_many :inhabitants, dependent: :destroy

  before_save :set_pop_zero_if_uninhabited

  private

  def set_pop_zero_if_uninhabited
    self.population = 0 unless inhabited?
  end
end
