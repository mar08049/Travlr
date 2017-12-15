class CommentsController < ApplicationController
  efore_action :set_place

  def index
    @comments = @place.comments
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end
end
