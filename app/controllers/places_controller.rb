class PlacesController < ApplicationController

  def index #show all user's places
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create #create new place
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

  def update #update place
    @place = Place.find(params[:id])
    @place.update(name: params[:name], memory: params[:memory])
    redirect_to place_path(@place)
  end

  def destroy #delete place
  end

  private

  def place_params
    params.require(:place).permit(:name, :memory)
  end

end
