require 'json'

class Bonk 
	attr_accessor :file

	def initialize
		@file
	end

	def get_file(filename)
		@file = JSON.parse(File.read(filename))
	end


end
	

