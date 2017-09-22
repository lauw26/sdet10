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
			@get_multiple_postcode = self.class.post('', body: { "postcodes" => single_postcode_array})
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

	class PostcodeInfo 

		attr_accessor :postcode, :longitude, :latitude

		def initialize(postcode, longitude, latitude)
			@postcode = postcode
			@longitude = longitude
			@latitude = latitude
		end

	end

	def random_postcodes(amount)
		@info_array = []
		amount.times do
			@post_array =  HTTParty.get('http://www.doogal.co.uk/CreateRandomPostcode.ashx').split(',')
			@info_array << PostcodeInfo.new(@post_array[0].delete(' '),@post_array[2].to_f,@post_array[1].to_f)
		end

		@info_array

	end

end

# include Postcodes

# puts Postcodes.random_postcodes(3)[0].postcode