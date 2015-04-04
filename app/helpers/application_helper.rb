module ApplicationHelper
	def pick_attributes(objects, *attributes)
		objects.map &extract_attributes_func(*attributes)
	end
	
	private
		def extract_attributes_func(*attributes)
			lambda { |object| extract_attributes object, *attributes }
		end

		def extract_attributes(object, *attributes)
			result = {}
			
			attributes.each { |attribute|
				result[attribute] = object[attribute]
			}
			
			result
		end
end
