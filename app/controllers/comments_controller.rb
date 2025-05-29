class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recommendation = Recommendation.find(params[:recommendation_id])
    @comment = @recommendation.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to recommendation_path(@recommendation) }
      end
    else
      render "recommendations/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
