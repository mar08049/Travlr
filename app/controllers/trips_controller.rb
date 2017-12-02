require 'pry'
class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @trip.places.build
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
     redirect_to user_trip_path(current_user, @trip)
    else
     render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])

  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to user_path(current_user)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :date, :user_id, :places_attributes => {})
  end
end
