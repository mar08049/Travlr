class PlacesController < ApplicationController

  def index #show all user's places
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create #create new place
    Place.create(name: params[:place][:name], memory: params[:place][:memory])
    redirect_to places_path(@place)
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

end
