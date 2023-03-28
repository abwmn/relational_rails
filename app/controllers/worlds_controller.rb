class WorldsController < ApplicationController
  include Generator
  def index
    @worlds = World.order(created_at: :desc).page(params[:page]).per(50)
  end

  def new
    @world = World.new
  end
  
  def create
    @world = World.new(world_params)
    
    if @world.save
      redirect_to worlds_url
    else
      render :new
    end
  end

  def edit
    @world = World.find(params[:id])
  end
  
  def update
    @world = World.find(params[:id])
    
    if @world.update(world_params)
      redirect_to world_path(@world)
    else
      render :edit
    end
  end

  def show
    @world = World.find(params[:id])
    @cities = @world.cities.order(created_at: :desc).page(params[:page]).per(50)
  end  

  def destroy
    @world = World.find(params[:id])
    @world.destroy
    redirect_to worlds_path
  end

  def generate_city
    @world = World.find(params[:id])

    city = City.create!(
      name: @world.name == 'Earth' ? generate_earth_city_name : generate_alien_city_name,
      population: rand(42000..42000000),
      world_id: @world.id,
      inhabited: true
    )
    generate_inhabitants(city, rand(111..333))
  
    flash[:success] = "A new city with inhabitants has been generated for #{@world.name}!"
    redirect_to world_cities_path(@world)
  end

  private

  def world_params
    params.require(:world).permit(:name, :number_of_continents, :climate, :inhabitable)
  end
end