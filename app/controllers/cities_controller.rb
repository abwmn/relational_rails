class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end

  def show
    @city = City.find(params[:id])
  end

  def world_cities
    @world = World.find(params[:world_id])
    @cities = @world.cities
  end
end