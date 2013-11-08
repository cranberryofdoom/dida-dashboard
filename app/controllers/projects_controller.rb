class ProjectsController < ApplicationController

	def index
		
	end

	def new
		@project = Project.new
		@organization = Organization.new
		@client = Client.new
	end

	def create
		p = Project.create(project_params)
		c = Client.create(client_params)
		o = Organization.create(organization_params)

		p.status = "unassigned"
		p.client = c
		o.client = c
		o.save
		p.save

		if Organization.find_by name: o.name
		end

		# flash[:alert] = "Project successfully created!"
		redirect_to p
	end

	def show
		@project = Project.find_by_id(params[:id])
	end

	private
	    # Using a private method to encapsulate the permissible parameters is just a good pattern
	    # since you'll be able to reuse the same permit list between create and update. Also, you
	    # can specialize this method with per-user checking of permissible attributes.
	    def project_params
	      params.require(:project).permit(:status, :due_date, :details, :direction, :kind)
	    end
	    def organization_params
	    	params.require(:organization).permit(:name, :description)
	    end
	    def client_params
	    	params.require(:client).permit(:email, :first_name, :last_name, :department)
	    end
end