
def show num
	puts num
end

def fizzbuzz
	puts "FizzBuzz"
end

def fizz
	puts "Fizz"
end

def buzz
	puts "Buzz"
end

def loop
	for i in 1..100
		compare i
	end
end

def compare nums
	if(multiple_of_three(nums) && multiple_of_five(nums))
		fizzbuzz
	elsif(multiple_of_three(nums))
		fizz
	elsif(multiple_of_five(nums))
		buzz
	else
		show nums
	end
end

def multiple_of_three number3
	if number3%3 == 0
		true
	else
		false
	end
end

def multiple_of_five number5
	if number5%5 == 0
		true
	else
		false
	end
end

loop




