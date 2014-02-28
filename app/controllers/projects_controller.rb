class ProjectsController < ApplicationController
## DON'T FORGET TO REMOVE THIS LATER!
if Rails.env.development?
	protect_from_forgery except: :update_team
end

def index
	@projects = Project.all
	respond_to do |format|
		format.html
		format.json { render :json => @projects.to_json(:include => [{:client => {:include => :organization}}, :team, :user])}

	end
end

def new
	@project ||= Project.new
	@project.client ||= Client.new
	@project.client.organization ||= Organization.new
end

def create
	p ||= Project.new(project_params)
	p.client = Client.create(client_params)
	p.client.organization = Organization.create(organization_params)
	p.status = "unassigned"
	p.save
	if p.errors.any?
		@project = p
		flash[:alert] = ("<ul><li>" << p.errors.full_messages.join("</li><li>") << "</li></ul>").html_safe
		redirect_to :back
		raise "check that shit"
		return
	end
	redirect_to project_path(p)
end

def delete
	p = Project.find params[:project_id]
	p.delete
	render :json => p
end

def show
	@project = Project.find_by_id(params[:id])
end

def update_team
	p = Project.find params[:project_id]
	t = Team.find(params[:team_id])
	p.team = t
	p.save
	if p.errors.any?
		@project = p
		flash[:alert] = ("<ul><li>" << p.errors.full_messages.join("</li><li>") << "</li></ul>").html_safe
		redirect_to :back
		raise "check that shit"
		return
	end
	render :json => p.team
end

def update_designer
	p = Project.find params[:project_id]
	u = User.find(params[:user_id])
	p.user = u
	p.status = "assigned"
	p.save
	if p.errors.any?
		@project = p
		flash[:alert] = ("<ul><li>" << p.errors.full_messages.join("</li><li>") << "</li></ul>").html_safe
		redirect_to :back
		raise "check that shit"
		return
	end
	render :json => p.user
end

private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def project_params
    	pp = params.except("client").except("organization").require(:project).permit(:status, :kind, :due_date, :details, :direction, :kind, {:mediums => []})
    	# hack to remove the blank item from project.mediums
    	pp["mediums"].delete("")
    	pp
    end
    def client_params
    	params[:project][:client].permit(:first_name, :last_name, :email, :department, :cell)
    end
    def organization_params
    	params[:project][:organization].permit(:name, :description)
    end
end