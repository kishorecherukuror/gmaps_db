class PlacesController < ApplicationController
  def index
    binding.pry
    file = File.read('lib/location.json')
    @places = JSON.parse(file)
    render json: @places
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "Place added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def place_params
    params.require(:place).permit(:title, :address, :visited_by)
  end
end