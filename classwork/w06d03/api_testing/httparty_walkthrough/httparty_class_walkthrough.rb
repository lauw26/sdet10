require 'httparty'

class Barclays
	include HTTParty 

	attr_accessor :homepage_body

	base_uri 'http://barclays.com'

	def initialize
		@homepage_body = call_homepage.body
		
	end

	def call_homepage
		self.class.get ''
	end

end

barc = Barclays.new

p barc.homepage_body