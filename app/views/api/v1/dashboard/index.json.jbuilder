json.status "success"

json.chart do
	json.caption			 "Chaitanya's Daily Expenses"
	json.subCaption			Date.today.strftime("%B %Y")
	json.numberprefix		 "$"
	json.theme			 	"fint"
end

json.data @data
