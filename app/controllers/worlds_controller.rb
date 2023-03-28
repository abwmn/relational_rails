class WorldsController < ApplicationController
  def index
    @worlds = World.order(created_at: :desc)
  end

  def show
    @world = World.find(params[:id])
  end
end