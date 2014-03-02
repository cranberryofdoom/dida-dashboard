class UsersController < ApplicationController
	respond_to :json
		## DON'T FORGET TO REMOVE THIS LATER!
		if Rails.env.development?
			protect_from_forgery :except => [:delete_designer]
		end

		def index
			@users = User.all
			respond_to do |format|
				format.html
				format.json { render :json => @users }
			end
		end

		def show
			@user = User.find(params[:id])
			respond_to do |format|
				format.html
				format.json { render :json => @user }
			end
		end

		def update
			update_user = User.find(params[:id])
			update_user.update_attributes!(params[:update_user])
			# update_user.netid = params[:update_user][:netid]
			# update_user.email = params[:update_user][:email]
			if update_user.valid?
				update_user.save!
			else
				render "public/422", :status => 422
				return
			end

    # Respond with newly created post in json format
    respond_with(update_user) do |format|
    	format.json { render :json => update_user.as_json }
    end  

end

def delete_designer
	u = User.find(params[:user_id])
	u.destroy
	u.save
	render :json => u
end

def user_params
	params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :privilege, :netid, :status, :payroll, :year, :area, :cell)
end
end