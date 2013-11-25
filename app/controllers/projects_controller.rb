class ProjectsController < ApplicationController
	## DON'T FORGET TO REMOVE THIS LATER!
	if Rails.env.development?
		protect_from_forgery except: :update_team
	end

	def index
		@projects = Project.all
		@users = User.all
		@teams = Team.all
		@unassigned_projects = Project.where(:status => "unassigned")
		@assigned_projects = Project.where(:status => "assigned")
		@archived_projects = Project.where(:status => "archived")
	end

	def save
		
	end

	def new
		@project ||= Project.new
		@project.client ||= Client.new
		@project.client.organization ||= Organization.new
	end
	def create
		p = Project.new(project_params)
		p.client = Client.create(client_params)
		p.client.organization = Organization.create(organization_params)
		p.status = "unassigned"
		p.save
		if p.errors.any?
			flash[:alert] = "That mothafuckin shit just failed for some reason :("
			redirect_to :method => new
			return
		end

		flash[:alert] = "Project successfully created!"
		redirect_to project_path(p)
	end

	def show
		@project = Project.find_by_id(params[:id])
	end

	def update_team
		project = Project.find params[:project_id]
		t = Team.find(params[:team_id])
		project.team = t
		project.save
		render :json => t.users.to_json
	end

	private
	    # Using a private method to encapsulate the permissible parameters is just a good pattern
	    # since you'll be able to reuse the same permit list between create and update. Also, you
	    # can specialize this method with per-user checking of permissible attributes.
	    def project_params
	    	params.except("client").except("organization").require(:project).permit(:status, :kind, :due_date, :details, :direction, :kind, {:mediums => []})
	    end
	    def client_params
	    	params[:project][:client].permit(:first_name, :last_name, :email, :department, :cell)
	    end
	    def organization_params
	    	params[:project][:organization].permit(:name, :description)
	    end
	end