class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def new
		@user = User.new
	end

	def create
		user = User.new
		if user.save
		redirect_to user_path(user), notice:"signup successfully!"
		end
	end


	def after_sign_in_path_for(resource)
      mypage_path(resource)
 	end

 protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

end
