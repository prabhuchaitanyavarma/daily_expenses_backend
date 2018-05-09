json.status 'success'
json.categories @categories do |category|
	json.id 				category.id
	json.name 				category.name
end

json.transactions @transactions do |transaction|
	json.partial! 'transaction.json.jbuilder', { transaction: transaction}
end
