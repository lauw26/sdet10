class Multiples_of_3_and_5

	attr_accessor :total

	def	initialize
		@total = 0
	end

	def loop(min_range, max_range)
		(min_range..max_range).each do |i|
			if compare?(i)
				@total += i
			end
		end
		@total
    end

    def compare?(comp_num)
    	divide_by?(comp_num,3) || divide_by?(comp_num,5)
    end

    def divide_by?(num,divisor)
    	num % divisor == 0
    end
end

multiples = Multiples_of_3_and_5.new

puts multiples.loop(0,999)