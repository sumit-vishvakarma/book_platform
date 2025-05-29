class RecommendationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recommendations = Recommendation.includes(:book, :user).trending
  end
	
	def show
		@recommendation = Recommendation.find(params[:id])
	end
	
	def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = current_user.recommendations.build(recommendation_params)
    if @recommendation.save
      redirect_to recommendations_path, notice: "Recommendation created!"
    else
      render :new
    end
  end

  private
  def recommendation_params
    params.require(:recommendation).permit(:book_id, :review)
  end
end
