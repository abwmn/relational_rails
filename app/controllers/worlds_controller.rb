class WorldsController < ApplicationController
  def index
    @worlds = World.all
  end
end