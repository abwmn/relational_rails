class InhabitantsController < ApplicationController
  def index
  if params[:sort] == 'name'
    @inhabitants = Inhabitant.where(married: true).order(:name)
  else
    @inhabitants = Inhabitant.where(married: true).order(created_at: :desc)
  end
  end

  def show
    @inhabitant = Inhabitant.find(params[:id])
  end

  def edit
    @inhabitant = Inhabitant.find(params[:id])
  end

  def update
    @inhabitant = Inhabitant.find(params[:id])

    if @inhabitant.update(inhabitant_params)
      redirect_to inhabitant_path(@inhabitant)
    else
      render :edit
    end
  end

  def city_inhabitants
    @city = City.find(params[:city_id])
    if params[:sort] == 'name'
      @inhabitants = @city.inhabitants.order(:name)
    else
      @inhabitants = @city.inhabitants
    end
  end

  private
  def inhabitant_params
    params.require(:inhabitant).permit(:name, :age, :city_id, :role, :married)
  end
end