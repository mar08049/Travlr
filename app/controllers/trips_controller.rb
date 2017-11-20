class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def create
    @place = Place.find(params[:id])
    @trip = @user.places.all
    if @trip.save
     redirect_to user_path(@user)
    else
     render :new
    end
  end

  def show
    @trip = @user.places.all
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to user_path
  end
end
