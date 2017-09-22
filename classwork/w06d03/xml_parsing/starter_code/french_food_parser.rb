require 'nokogiri'

doc = Nokogiri::XML(open('french_food.xml'))

# p doc.search('price').children.first.text.gsub("£","").to_f.class

# puts doc.xpath('//food/*')

doc.xpath('//food').each do |food|
	puts food.search('price').text
end