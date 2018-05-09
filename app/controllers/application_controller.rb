class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def current_user
    	authorization_header = request.headers['Authorization']
    	if authorization_header
      		token = authorization_header.scan(/token=(.*)/).first.first
      		@current_user ||= User.find_by_authentication_token(token)
    	end
  	end
end
