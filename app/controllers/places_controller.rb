class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @trip = Trip.find(params[:id])
    @place = Place.find(params[:id])
  end

  def show
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(name: params[:name], memory: params[:memory])
    redirect_to user_trip_place_path(@place)
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to user_trip_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :memory, :user_id, :trip_id)
  end

end
