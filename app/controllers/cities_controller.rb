class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end

  def show
    @city = City.find(params[:id])
  end
end