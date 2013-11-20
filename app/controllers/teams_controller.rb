class TeamsController < ApplicationController

	def index
		@teams = Team.all
		@team = Team.new
	end

	def save
	end

	def new
	end

	def create
		t = Team.create(team_params)
		redirect_to :controller => 'teams', :action => 'index'
	end

	def show
	end

	def destroy
		Team.find(params[:id]).destroy
    	redirect_to :controller => 'teams', :action => 'index'
	end

	private
	def team_params
		params.require(:team).permit(:name)
	end


end
