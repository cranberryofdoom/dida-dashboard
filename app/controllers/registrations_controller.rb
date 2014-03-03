class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    # devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :privilege, :netid, :status, :payroll, :year, :area, :cell, :admin, :project_manager, :role_ids, :user_id)}
  end

end
