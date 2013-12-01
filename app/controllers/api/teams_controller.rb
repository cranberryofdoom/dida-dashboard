class Api::TeamsController < ApplicationController

	def index
		@teams = Team.all
		render json: @teams.to_json(:include => :users)
	end

	def show
		@team = Team.find(params[:id])
		render json: @team.to_json(:include => :users)
	end

end