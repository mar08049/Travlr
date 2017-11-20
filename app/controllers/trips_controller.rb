class TripsController < ApplicationController

  def index
    if params[:user_id]
      @trips = User.find(params[:author_id]).trips
    else
      @trips = Trip.all
    end
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
    @trip = Trip.find(params[:id])
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
