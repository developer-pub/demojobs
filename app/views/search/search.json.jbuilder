json.startIndex @start_index
json.endIndex @end_index
json.pageNumber @page_number
json.pageCount @page_count
json.offersCount @offers_count

json.offers do
	json.array! pick_attributes @offers_limited, :title, :body
end
