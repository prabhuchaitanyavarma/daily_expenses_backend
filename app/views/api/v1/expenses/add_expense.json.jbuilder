json.status 'success'

json.transactions @transactions do |transaction|
	json.partial! 'transaction.json.jbuilder', { transaction: transaction}
end
