class CommentsController < ApplicationController
  before_action :set_place

  def index
    @comments = @place.comments

    render :layout => false
    #render :json => @comments
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end
end


# $("a[href="/places/1/comments"]").on("click"), function(e){e.preventDefault();alert("You clicked this link!!!")})
