class WorldsController < ApplicationController
  def index
    @worlds = World.all
  end

  def show
    @world = World.find(params[:id])
  end
end