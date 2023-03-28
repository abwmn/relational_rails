class CitiesController < ApplicationController
  include Generator
  def index
    if params[:sort] == 'name'
      @cities = City.where(inhabited: true).order(:name).page(params[:page]).per(50)
    else
      @cities = City.where(inhabited: true).order(created_at: :desc).page(params[:page]).per(50)
    end
  end

  def new
    if params[:world_id]
      @world = World.find(params[:world_id])
      @city = @world.cities.new
    else
      @city = City.new
    end
  end

  def create
    if params[:world_id]
      @world = World.find(params[:world_id])
      @city = @world.cities.new(city_params)
      redirect_path = world_cities_path(@world)
    else
      @city = City.new(city_params)
      redirect_path = cities_path
    end

    if @city.save
      redirect_to redirect_path
    else
      render :new
    end
  end

  def edit
    @city = City.find(params[:id])
  end
  
  def update
    @city = City.find(params[:id])
    
    if @city.update(city_params)
      redirect_to city_path(@city)
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end

  def show
    @city = City.find(params[:id])
    @inhabitants = @city.inhabitants.order(created_at: :desc).page(params[:page]).per(50)
  end
  

  def world_cities
    @world = World.find(params[:world_id])
    if params[:sort] == 'name'
      @cities = @world.cities.order(:name).page(params[:page]).per(50)
    else
      @cities = @world.cities.order(created_at: :desc).page(params[:page]).per(50)
    end
    if params[:min_population]
      @cities = @cities.where('population >= ?', params[:min_population])
    end
  end

  def generate_inhabitants_action
    @city = City.find(params[:id])
  
    count = rand(55..222)
    generate_inhabitants(@city, count)
  
    flash[:success] = "#{count} new inhabitants have been generated!"
    redirect_to city_path(@city)
  end
  
  

  private
  
  def city_params
    params.require(:city).permit(:name, :population, :technological_level, :inhabited)
  end
end