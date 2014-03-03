class UsersController < ApplicationController
	before_filter :authenticate_user!

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

	end

	def update
		authorize! :update, @user, :message => 'Not authorized as admin'
		@user = User.find(params[:id])
		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end
		if @user.update_attributes(params[:user])
			redirect_to users_path, :notice => "Updated Designer!"
		else
			redirect_to users_path, :alert => "Can't update designer"
		end
	end

	def edit
		authorize! :update, @user, :message => 'Not authorized as admin'
		@user = User.find(params[:id])
		if !@user.update_attributes(params[:user])
			redirect_to users_path, :alert => "can't update whyy"
		end
	end

	def delete_designer
		u = User.find(params[:user_id])
		u.destroy
		u.save
		render :json => u
	end

	def destroy
		authorize! :destroy, @user, :message => 'Not authorized as admin'
		user = User.find(params[:id])
		unless user == current_user
			user.destroy
			redirect_to users_path, :notice => "User deleted"
		else
			redirect_to users_path, :notice => "Can't delete yourself"
		end
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :privilege, :netid, :status, :payroll, :year, :area, :cell, :admin, :project_manager)
	end
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:account_update) { |u| 
			u.permit(:password, :password_confirmation, :current_password) 
		}
	end
end