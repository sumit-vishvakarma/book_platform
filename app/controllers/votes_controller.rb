class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
		@recommendation = Recommendation.find(params[:recommendation_id])
		@vote = @recommendation.votes.build(user: current_user)
	
		if @vote.save
			respond_to do |format|
				format.turbo_stream
				format.html { redirect_to recommendations_path, notice: "Thanks for voting!" }
			end
		else
			render turbo_stream: turbo_stream.replace(@recommendation, partial: "recommendations/recommendation", locals: { recommendation: @recommendation })
		end
	end
end
