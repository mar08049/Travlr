require 'pry'
class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
     redirect_to trips_path(@trip)
    else
     render :new
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @trip.destroy
    redirect_to user_path
  end

  private

  def trip_params
    params.permit(:name, :date)
  end
end
