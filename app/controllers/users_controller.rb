class UsersController < ApplicationController
  def show
		@user = User.find(params[:id])
		@recommendations = @user.recommendations.includes(:book, :votes)
	end
end
