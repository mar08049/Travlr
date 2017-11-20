class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def create
    @trip = @user.trips.new(trip_params)
    if @trip.save
     redirect_to user_path(@user)
    else
     render :new
    end
  end

  def show

  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to user_path
  end

  private

  def place_params
    params.require(:trip).permit(:name, :date)
  end
end
