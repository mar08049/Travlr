class CommentsController < ApplicationController
  before_action :set_place

  def index
    @comments = @place.comments
    respond_to do |format|
      format.html { render 'index.html', :layout => false }
      format.json { render json: @comments }
     end
  end

  def create
    @comment = @place.comments.build(comments_params)
    if @comment.save
        # render 'comments/show', :layout => false
        render json: @comment
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
