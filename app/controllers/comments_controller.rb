class CommentsController < ApplicationController
  before_action :set_place

  def index
    @comments = @place.comments

    #render :layout => false
    render :json => @comments
  end

  def create
    @comment = @place.comments.build(comments_params)
    if @comment.save
      redirect_to @place
    else
      render "places/show"
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def comments_params
    params.require(:comment).permit(:name, :description)
  end
end
