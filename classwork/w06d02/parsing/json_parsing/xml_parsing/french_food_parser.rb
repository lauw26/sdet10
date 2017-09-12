require 'nokogiri'

doc = Nokogiri::XML(open('french_food.xml'))

puts doc.search('price').children.first.text.gsub("£","").to_f.class