class SearchController < ApplicationController
	def search
		perform_search
	end

	def search_dynamic
		perform_search
	end

	private
		def perform_search
			@per_page = (params_sanit[:per_page] || 10).to_i
			@page_number = (params_sanit[:page_number] || 1).to_i
			@page_number = [[@page_number, 1024 * 1024].min, 1].max
			@category = params_sanit[:category] || ""
			@category_id = params_sanit[:category_id]
			@body = params_sanit[:body] || ""

			@query_params = {per_page: @per_page, category_id: @category_id, category: @category, body: @body}

			@offers_full = Offer.joins(:category)
				.where('lower(categories.name) like lower(:value)', {value: like_outer(@category)})
				.where('lower(offers.title) like lower(:value) OR lower(offers.body) like lower(:value)', 
						{value: like_outer(@body), }
					)

			@offers_full = @offers_full.where('categories.id = :value', {value: @category_id}) unless @category_id.nil?

			@offers_count = @offers_full.count
			@offers_limited = @offers_full.limit(@per_page).offset((@page_number - 1) * @per_page)

			@start_index = ((@page_number - 1) * @per_page) + 1
			@end_index = [@start_index + @per_page - 1, @offers_count].min

			@page_count = (@offers_count / @per_page) + (@offers_count % @per_page > 0 ? 1 : 0)
		end

		def params_sanit
			params.permit(:category, :category_id, :body, :per_page, :page_number)
		end

		def escape_like(string)
			string.gsub('%', '\\\\%').gsub('_', '\\\\_')
		end

		def like_outer(string)
			"%" + escape_like(string) + "%"
		end
end
