class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.valid?
      @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit #render form to edit place
    @place = Place.find(params[:id])
  end

  def show #show single place with details
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(name: params[:name], memory: params[:memory])
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to place_path 
  end

  private

  def place_params
    params.require(:place).permit(:name, :memory)
  end

end
