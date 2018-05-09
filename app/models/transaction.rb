class Transaction < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	scope :month, -> {where(date: DateTime.now.beginning_of_month..DateTime.now.end_of_month)}
	scope :quarter, -> {where(date: DateTime.now.beginning_of_month-6.month..DateTime.now.end_of_month)}
	scope :year, -> {where(date: DateTime.now.beginning_of_month-12.month..DateTime.now.end_of_month)}

end
