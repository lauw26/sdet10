module Mammals

	def self.common_traits
		puts 'Mammals have lungs, all express milk, have vetebrae and is warm blooded'
	end

	class Quadrupleped 

		def self.four_legs
			puts 'I HAVE 4 LEGS'
		end

	end

	class Biped 

		def self.two_legs
			puts 'I HAVE 2 LEGS'
		end

	end 

end

# Mammals.common_traits

# fox = Mammals::Biped.new

# fox.two_legs
