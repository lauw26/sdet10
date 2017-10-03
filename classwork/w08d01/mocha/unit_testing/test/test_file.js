var expect = chai.expect

describe('multipleOfThree', function(){
	it('Should return a true boolean when entered with a multiple of three', function(){
		var num = 12;

		expect(multipleOfThree(num)).to.be.true;
	})

	it('Should return a false boolean when entered with a none multiple of three', function(){
		var num = 14;

		expect(multipleOfThree(num)).to.be.false;
	})
})

describe('multipleOfFive', function(){
	it('Should return a true boolean when entered with a multiple of five', function(){
		var num = 25;

		expect(multipleOfFive(num)).to.be.true;
	})

	it('Should return a false boolean when entered with a none multiple of five', function(){
		var num = 52;

		expect(multipleOfFive(num)).to.be.false;
	})
})

describe('compare', function(){
	it('Should return fizz when a number is just a multiple of three',function(){
		var num = 9;

		expect(compare(num)).to.equal("fizz");
	})

	it('Should return buzz when a number is just a multiple of five',function(){
		var num = 10;

		expect(compare(num)).to.equal("buzz");
	})

	it('Should return fizzbuzz when a number is a multiple of three and five',function(){
		var num = 15;

		expect(compare(num)).to.equal("fizzbuzz");
	})

	it('Should return the number when the number is not a multiple of three or five',function(){
		var num = 23;

		expect(compare(num)).to.equal(num);
	})
})

describe('loop', function(){
	var amount = 15;
	var result = loop(amount);
	var expected = [1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz"]

	it('Should return an array with a length of the amount stated', function(){
		expect(result.length).to.equal(amount);
	})

	it("Should match the expected array for the first 15 numbers", function(){
		expect(result).to.be.eql(expected);
	})
})