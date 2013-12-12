class TeamsController < ApplicationController
	## DON'T FORGET TO REMOVE THIS LATER!
	if Rails.env.development?
		protect_from_forgery :except => [:add_designer, :remove_designer, :create_user, :delete_designer]
	end

	def index
		@teams = Team.all
		@team = Team.new
		@users = User.all
		@user = User.new
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
		t = Team.find params[:team_id]
		t.destroy
		t.save
		render :json => t
	end

	def delete_designer
		u = User.find(params[:user_id])
		u.destroy
		u.save
		render :json => u
	end

	def remove_designer
		t = Team.find params[:team_id] 
		u = User.find(params[:user_id])
		t.users.delete(User.find_by_id(u.id))
		t.save
		render :json => u
	end

	def add_designer
		t = Team.find params[:team_id]
		u = User.find(params[:user_id])
		t.users << u
		t.save
		render :json => u
	end

	def create_user
		u = User.create(user_params)
		redirect_to :controller => 'teams', :action => 'index'
	end

	private
	def team_params
		params.require(:team).permit(:name)
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :privilege, :netid, :status, :payroll, :year, :area, :cell)
	end

end
