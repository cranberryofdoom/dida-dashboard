class ProjectsController < ApplicationController

# DON'T FORGET TO REMOVE THIS LATER!
if Rails.env.development?
	protect_from_forgery :except => [:update_team, :create_post]
end

def index
	@projects = Project.all
	respond_to do |format|
		format.html
		format.json {render :json => @projects.to_json(:include => [{:client => {:include => :organization}}, :team, :user])}
	end
end

def new
	@project ||= Project.new
	@project.client ||= Client.new
	@project.client.organization ||= Organization.new
end

def create
	p ||= Project.new(p_params)
	p.client ||= Client.create(c_params)
	p.client.organization = Organization.create(o_params)
	p.status = "unassigned"
	p.save
	render 'success'
end

def destroy
	p = Project.find(params[:id])
	p.delete
	render :json => p
end

def show
	@project = Project.find_by_id(params[:id])
	@post ||= Post.new
end

def create_post
	pr = Project.find(params[:project_id])
	p = pr.posts.new(pt_params)
	p.user = current_user
	p.save
	redirect_to :back
end

def update
	@project = Project.find_by_id(params[:id])
	if @project.update_attributes(upload_files_params)
		flash[:notice] = "Successfully uploaded file."
		redirect_to @project
	else
		flash[:notice] = "error."
	end
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
    def upload_files_params
    	params.require(:project).permit(:file)
    end

    def pt_params
    	params["post"].permit(:content)
    end

    def p_params
    	p = params["project"].except("client").except("organization").permit(:status, :kind, :due_date, :details, :direction, :kind, {:mediums => []})
    	p["mediums"].delete("")
    	p
    end

    def c_params
    	params["project"]["client"].permit(:first_name, :last_name, :email, :department, :cell)
    end

    def o_params
    	params["project"]["organization"].permit(:name, :description)
    end
end