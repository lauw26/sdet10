require 'json'
require 'httparty'

class Bonk 
	attr_accessor :file

	def initialize
		@file
	end

	def get_file(filename)
		@file = JSON.parse(HTTParty.get(filename).body)
	end


end
	

