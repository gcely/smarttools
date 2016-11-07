require 'mongo' 

class ApplicationController < ActionController::Base
 
protect_from_forgery with: :exception
 

  protected

  #before_filter :configure_permitted_parameters, if: :devise_controller?
   before_action :configure_permitted_parameters, if: :devise_controller?


    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password])
			Rails.cache.write("nombre", :name)
			Rails.cache.write("correo", :email)
			Rails.cache.write("pw", :password)
        end
		
		def find_session(id)
          session_class.where(:_id => id).first || session_class.new(:_id => id)
        end

end
