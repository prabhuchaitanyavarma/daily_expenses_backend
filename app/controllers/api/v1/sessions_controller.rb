class Api::V1::SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def create
		if params && params[:user]
			email = params[:user][:email]
			user = User.where(email: email).first
			if user && user.authenticate(params[:user][:password])
				render json: {status: "success", message: "You have successfully signed in.",  authentication_token: user.authentication_token}
			else
				render json: { status: "fail", message: "Your email or password is incorrect" }
			end
		end
	end

end
