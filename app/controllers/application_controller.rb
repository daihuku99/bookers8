class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters,if: :devise_controller?
	before_action :request_path

	def after_sign_in_path_for(resource)
		user_path(current_user)
	end

	def after_sign_out_path_for(resource)
		'/'
	end

	def request_path
		@path = controller_path + '#' + action_name
		def @path.is(*str)
			str.map{|s| self.include?(s)}.include?(true)
		end
	end

	private
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
	end

end
