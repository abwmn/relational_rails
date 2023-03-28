class InhabitantsController < ApplicationController
  def index
  if params[:sort] == 'name'
    @inhabitants = Inhabitant.where(married: true).order(:name).page(params[:page]).per(50)
  else
    @inhabitants = Inhabitant.where(married: true).order(created_at: :desc).page(params[:page]).per(50)
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

  def destroy
    inhabitant = Inhabitant.find(params[:id])
    city = inhabitant.city
    inhabitant.destroy
  
    if request.referer.include?('city_inhabitants')
      redirect_to city_inhabitants_path(city)
    else
      redirect_to inhabitants_path
    end
  end

  def city_inhabitants
    @city = City.find(params[:city_id])
    if params[:sort] == 'name'
      @inhabitants = @city.inhabitants.order(:name).page(params[:page]).per(50)
    else
      @inhabitants = @city.inhabitants.page(params[:page]).per(50)
    end
    if params[:min_age]
      @inhabitants = @inhabitants.where('age >= ?', params[:min_age]).page(params[:page]).per(50)
    end
  end

  private
  def inhabitant_params
    params.require(:inhabitant).permit(:name, :age, :city_id, :role, :married)
  end
end