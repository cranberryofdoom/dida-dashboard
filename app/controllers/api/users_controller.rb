class Api::UsersController < ApplicationController
	
	def index
		@team = Team.find(params[:team_id])
		@users = @team.users
		render json: @users
	end

	def show
		@team = Team.find(params[:team_id])
		@users = @team.users
		@user = @users.find(params[:id])
		render json: @user
	end
end