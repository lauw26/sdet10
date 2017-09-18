require 'httparty'

response = HTTParty.get('http://twitter.com')

p response.code
p response.message
p response.headers.inspect