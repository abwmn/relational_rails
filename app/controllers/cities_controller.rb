class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end

  def new
    @city = City.new
  end
  
  def create
    @city = City.new(city_params)
    
    if @city.save
      redirect_to cities_path
    else
      render :new
    end
  end

  def show
    @city = City.find(params[:id])
  end

  def world_cities
    @world = World.find(params[:world_id])
    @cities = @world.cities
  end

  private
  
  def city_params
    params.require(:city).permit(:name, :world_id, :population, :technological_level, :inhabited)
  end
end