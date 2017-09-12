class Even_fibonacci

	attr_accessor :total, :num1, :num2, :fib_nums, :even_sum

	def	initialize
		@total = 0
		@even_sum = 2
		@num1 = 1
		@num2 = 2
		@fib_nums = []
		@fib_nums << @num1
		@fib_nums << @num2
	end

	def fib_run min
		i = 1
		loop do
			@total = add_nums(@num1, @num2)
			break if(!check?(@total, min)) 
			@even_sum += even_total(@total)
			@fib_nums << @total
			overide(i)
			i += 1
		end 
	end

	def even_total(even_num)
		if(divide_by?(even_num,2))
			even_num
		else
			0
		end
	end

	def overide(loop_check)
		if(divide_by?(loop_check,2))
			@num2 = @total
		else
			@num1 = @total 
		end
	end	

	def add_nums(num01, num02)
		num01 + num02
	end

	def check?(num, min)
		num <= min
	end

	def divide_by?(div_num, divisor)
		(div_num % divisor).zero?
	end

end
