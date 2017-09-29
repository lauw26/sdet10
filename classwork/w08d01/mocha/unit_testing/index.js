function multipleOfThree(num){
	if(num%3 == 0){
		return true
	}else{
		return false
	}
}

function multipleOfFive(num){
	if(num%5 == 0){
		return true
	}else{
		return false
	}
}

function compare(num){
	if(multipleOfFive(num) && multipleOfThree(num)){
		return "fizzbuzz"
	}else if(multipleOfThree(num)){
		return "fizz"
	}else if(multipleOfFive(num)){
		return "buzz"
	}else{
		return num
	}
}

function loop(amount){
	var array = []

	for(var i = 1; i <= amount; i++){
		array.push(compare(i))
	}

	return array
}