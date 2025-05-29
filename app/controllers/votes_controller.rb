class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @recommendation = Recommendation.find(params[:recommendation_id])
    @vote = @recommendation.votes.find_or_create_by(user: current_user)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to recommendations_path }
    end
  end
end
