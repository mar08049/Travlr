require 'pry'
class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new(trip_id: params[:trip_id])
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to trip_place_path(:trip_id, @place)
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def show
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to trip_place_path(@place)
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to user_path(current_user)
  end

  private

  def place_params
    params.require(:place).permit(:name, :memory, :user_id, :trip_id)
  end

end
