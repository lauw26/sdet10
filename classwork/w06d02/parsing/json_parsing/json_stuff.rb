# json = {
# 	test: "test1"
# }

# puts json.class

# json_file = File.read('example_json.json')

require 'json'

new_file = JSON.parse(File.read('example_json.json'))

puts new_file.keys