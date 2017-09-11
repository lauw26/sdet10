require_relative '../animal'
require_relative '../animal_types/mammals'

class Cheetah < Animal

	include Mammals

	def speak
		puts 'MEOW!'
	end

	def four_legs
		Quadrupleped.four_legs
	end

end

boris = Cheetah.new
nigel = Cheetah.new

nigel.four_legs


