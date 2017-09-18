require 'faker'
require 'random-word'

class RandomStory

	def tell
		# puts RandomWord.nouns.next
		puts "There was once a #{Faker::Pokemon.name} called #{Faker::Name.name} from #{Faker::Pokemon.location} who was very #{RandomWord.adjs.next}"
		puts "One eventful day he met a #{Faker::Pokemon.name} who was being #{RandomWord.vers.next}ed by a #{Faker::Pokemon.name}"
	end

end

story = RandomStory.new

story.tell