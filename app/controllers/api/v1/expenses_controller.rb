class Api::V1::ExpensesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		begin
			duration = params[:duration]
			@transactions = transactions_in_duration duration
			@categories = Category.all
		rescue
		 	render json: { status: "fail", message: "Something went wrong" }
		end
	end

	def expenses_by_date
		begin
			month = Date::ABBR_MONTHNAMES.index(params[:month])
			@transactions = current_user.transactions.where('extract(month from date) = ? AND extract(year from date) = ?', month, params[:year])
		rescue
			render json: { status: "fail", message: "Something went wrong" }
		end
	end

	def add_expense
		begin
			transaction = current_user.transactions.new(transaction_params)
			if transaction.save
				@transactions = transactions_in_duration "month"
			end
		rescue
			render json: { status: "fail", message: "Something went wrong" }
		end
	end

	def update
		transaction = Transaction.find(params[:transaction][:id])
		begin
			transaction = transaction.update_attributes(transaction_params)
			@transactions = transactions_in_duration "month"
		rescue
			render json: { status: "fail", message: "Something went wrong" }
		end
	end

	def delete
		transaction = Transaction.find(params[:id])
		begin
			transaction = transaction.destroy
			render json: { status: "success" }
		rescue
			render json: { status: "fail", message: "Something went wrong" }
		end
	end


	private

		def transaction_params
    		params[:transaction].permit(:amount, :description, :category_id, :date, :time, :transaction_type)
		end

		def transactions_in_duration(duration="month")
			if duration == "month"
				current_user.transactions.month.reverse
			elsif duration == "quarter"
				current_user.transactions.quarter.reverse
			elsif duration == "year"
				current_user.transactions.year.reverse
			else
				current_user.transactions.all.reverse
			end
		end



end
