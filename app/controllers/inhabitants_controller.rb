class InhabitantsController < ApplicationController
  def index
    @inhabitants = Inhabitant.all
  end

  def show
    @inhabitant = Inhabitant.find(params[:id])
  end

  def city_inhabitants
    @city = City.find(params[:city_id])
    @inhabitants = @city.inhabitants
  end
end