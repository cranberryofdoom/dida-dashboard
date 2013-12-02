class Api::ProjectsController < ApplicationController
	def index
		@projects = Project.all
		render json: @projects.to_json(:include => [{:client => {:include => :organization}}, :team, :user])
	end
end