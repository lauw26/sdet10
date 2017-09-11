require_relative 'living_organism'

class Animal < LivingOrganism	

	def self.traits
		puts 'Animals can creath, eat and pro-create'
	end

	def breathe
		puts 'inhale and exhale'
	end

	def pro_create
		puts 'stuff'
	end

	def eat
		puts 'nom nom nom'
	end

	def speak
		puts 'Hello!'
	end	

end

