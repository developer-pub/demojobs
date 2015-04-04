json.start_index @start_index
json.end_index @end_index
json.offers_count @offers_count

json.offers do
	json.array! pick_attributes @offers_limited, :title, :body
end
