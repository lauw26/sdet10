class Fizzbuzz
	attr_accessor :nums_array

	def	initialize
		# declares number array
		@nums_array = []
		# runs loop
		loop
	end
	# pushes i into the array
	def loop
		for i in 1..100
		 	@nums_array << compare(i)
		end
	end
	# Returns true if number is divisable by 3
	def multiple_of_three?(number3)
		number3 % 3 == 0	
	end
	# Return true if number is i=divisable by 5
	def multiple_of_five?(number5)
		number5 % 5 == 0
	end
	# Compares number to see what to return
	def compare nums
		if(multiple_of_three?(nums) && multiple_of_five?(nums))
			"Fizzbuzz"
		elsif(multiple_of_three?(nums))
			"Fizz"
		elsif(multiple_of_five?(nums))
			"Buzz"
		else
			nums
		end
	end

end