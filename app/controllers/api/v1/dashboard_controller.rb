class Api::V1::DashboardController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		duration = params[:duration]
		transactions =  if duration == "month"
			current_user.transactions.month
		elsif duration == "quarter"
			current_user.transactions.quarter
		elsif duration == "year"
			current_user.transactions.year
		else
			current_user.transactions.all
		end
		@data = transactions.joins(:category).group('categories.name').sum(:amount).map{|key, val| {label: key, value: val}}
	end
end
