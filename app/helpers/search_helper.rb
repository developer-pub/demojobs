module SearchHelper
	def generate_link(page_number) 
		link_to(page_number, search_path(page_number, @query_params))
	end

	def generate_links(from, to)
		(from .. to).map{ |num| generate_link(num) }.join
	end

	def generate_dynamic_links_side(from, to, cutoff, left_count, right_count)
		if to - from < cutoff
			return generate_links(from, to)
		else
			return generate_links(from, from + left_count) << content_tag('span', '...') << generate_links(to - right_count, to)
		end
	end

	def generate_paging_links(current_page, page_count)
		cutoff = 7
		outer_side = 2
		inner_side = 1

		result = ""

		result << generate_dynamic_links_side(1, current_page - 1, cutoff, outer_side, inner_side)
		result << generate_link(current_page)
		result << generate_dynamic_links_side(current_page + 1, page_count, cutoff, inner_side, outer_side)

		result.html_safe
	end
end
