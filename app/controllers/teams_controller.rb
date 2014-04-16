class TeamsController < ApplicationController
	
	# DON'T FORGET TO REMOVE THIS LATER!
	if Rails.env.development?
		protect_from_forgery :except => [:add_designer, :remove_designer, :create_user]
	end

	def index
		@teams = Team.all
		@team = Team.new
		@users = User.all
		@user = current_user
		respond_to do |format|
			format.html
			format.json { render :json => @teams.to_json(:include => :users) }
		end
	end

	def new
	end

	def create
		Team.create(t_params)
		redirect_to :controller => 'teams', :action => 'index'
	end

	def show
		@team = Team.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render :json => @team.to_json(:include => :users) }
		end
	end

	def destroy
		t = Team.find(params[:id])
		t.delete
		render :json => t
	end


	def remove_designer
		t = Team.find(params[:team_id])
		u = User.find(params[:user_id])
		t.users.delete(User.find_by_id(u.id))
		t.save
		render :json => u
	end

	def add_designer
		t = Team.find(params[:team_id])
		u = User.find(params[:user_id])
		t.users << u
		t.save
		render :json => u
	end

	def create_user
		u = User.create(u_params)
		if u.admin?
			u.add_role :admin
		elsif u.pm?
			u.add_role :pm
		elsif u.designer?
			u.add_role :designer
		end	
		redirect_to :controller => 'teams', :action => 'index'
	end

	private
	def t_params
		params.require(:team).permit(:name)
	end

	def u_params
		params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :position, :netid, :status, :payroll, :year, :area, :cell)
	end

end
