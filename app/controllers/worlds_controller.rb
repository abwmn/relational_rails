class WorldsController < ApplicationController
  def index
    @worlds = World.order(created_at: :desc)
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
  end

  private
  
  def world_params
    params.require(:world).permit(:name, :number_of_continents, :climate, :inhabitable)
  end
end