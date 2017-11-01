class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
  	flash[:notice] = "you are not allowed to perform this action."
    redirect_to root_url, :alert => exception.message
  end

	private
		def configure_permitted_parameters
			if params[:commit] == "Sign up"
				if params[:user][:secret_code_id].blank?
					flash[:error] = "secret code cant be blank"
					redirect_to root_path
				else
					secret_code = SecretCode.find_by_code(params[:user][:secret_code_id])
					if secret_code.blank?
						flash[:error] = "Invalid secret code"
						redirect_to root_path
					else
						if secret_code.user.blank?
							params[:user][:secret_code_id] = secret_code.id
				 			devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name,:last_name,:secret_code_id])
						else
							flash[:error] = "Invalid secret code"
							redirect_to root_path
				 		end
			 		end
			 	end
			end
		end
end
