class PlacesController < ApplicationController::Base

  def index #show all user's places
    @places = @user.place.all  #??
  end

  def create #create new place
    Place.create(name: params[:place][:name], memory: params[:place][:memory])
    redirect_to places_path
  end

  def new #render form for new place
  end

  def edit #render form to edit place
  end

  def show #show single place with details
    @place = Place.find(params[:id])
  end

  def update #update place
  end

  def destroy #delete place
  end
end
