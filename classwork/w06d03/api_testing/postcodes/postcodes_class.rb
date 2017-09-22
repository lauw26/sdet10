require 'json'
require 'httparty'

module Postcodes

	# Class for single postcode service
	class SinglePostcode

		include HTTParty 

		base_uri 'http://api.postcodes.io/postcodes'
		# Takes in postcode and get response 
		def initialize(single_postcode_string)
			@get_single_postcode = self.class.get("/#{single_postcode_string}")
		end

		def get_single_headers
			@get_single_postcode.headers.inspect
		end

		def get_single_body
			JSON.parse(@get_single_postcode.body)
		end

		def get_single_response_message
			@get_single_postcode.message
		end

		def get_single_response_code
			@get_single_postcode.code
		end

	end

	class MultiplePostcode

		include HTTParty 

		base_uri 'http://api.postcodes.io/postcodes'

		def initialize(single_postcode_array)
			@get_multiple_postcode = self.class.post('', body: single_postcode_array)
		end

		def get_multiple_headers
			@get_multiple_postcode.headers.inspect
		end

		def get_multiple_body
			JSON.parse(@get_multiple_postcode.body)
		end

		def get_multiple_response_message
			@get_multiple_postcode.message
		end

		def get_multiple_response_code
			@get_multiple_postcode.code
		end

	end

end

many_postcodes = {
  "postcodes" => ["OX49 5NU", "M32 0JG", "NE30 1DP"]
}

# show = Postcodes::SinglePostcode.new("b145rs")
showmany = Postcodes::MultiplePostcode.new(many_postcodes)
# p show.get_single_body
p showmany.get_multiple_body