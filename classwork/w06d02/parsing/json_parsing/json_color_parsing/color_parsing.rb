require 'json'
file = JSON.parse(File.read('colors.json'))

jsonception = file['colors']

jsonception.each do |colour|
	puts "==============================="
	puts "Color: #{colour['color']}"
	puts "Category: #{colour['category']}"
	puts "Type: #{colour['type']}"
	puts "rgba: #{colour['code']['rgba']}"
	puts "hex: #{colour['code']['hex']}"
end