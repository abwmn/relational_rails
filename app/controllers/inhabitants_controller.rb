class InhabitantsController < ApplicationController
  def index
    @inhabitants = Inhabitant.all
  end

  def show
    @inhabitant = Inhabitant.find(params[:id])
  end
end