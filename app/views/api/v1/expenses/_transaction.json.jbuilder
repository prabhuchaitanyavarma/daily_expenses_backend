json.id 				transaction.id
json.amount 			transaction.amount
json.description 		transaction.description
json.category 			transaction.category.try(:name)
json.category_id 		transaction.category.try(:id)
json.date 				transaction.date
json.time_in_12_hours 	transaction.time.strftime("%I:%M %p")
json.time_in_24_hours 	transaction.time.strftime("%H:%M")