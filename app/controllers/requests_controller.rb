class RequestsController < ApplicationController
	def new
		render 'new'
	end

	def create
		r = Request.new
		params[:basic].each do |i, param|
			if param[:name] == "firstName"
				r.firstName = param[:value]
			elsif param[:name] == "lastName"
				r.lastName = param[:value]
			elsif param[:name] == "orgName"
				r.orgName = param[:value]
			elsif param[:name] == "cellNumber"
				r.cellNumber = param[:value]
			elsif param[:name] == "fundCode"
				r.fundCode = param[:value]
			elsif param[:name] == "eMail"
				r.eMail = param[:value]
				puts param[:value]
			end 
		end
		if params[:medium] != nil
			params[:medium].each do |i, param|
				if param[:value] == "true"
					r.printMedium << param[:name]
				end 
			end
		end
		params[:details].each do |i, param|
			if param[:name] == "orgDescription"
				r.orgDescription = param[:value]
			elsif param[:name] == "projectDirection"
				r.projectDirection = param[:value]
			elsif param[:name] == "projectDetails"
				r.projectDetails = param[:value]
			elsif param[:name] == "dueDate"
				r.dueDate = param[:value]
			end 
		end
		r.requestType = params[:kind];
		r.save
		RequestMailer.request_email(r).deliver
		render :nothing => true
	end

	def success
	end
end
