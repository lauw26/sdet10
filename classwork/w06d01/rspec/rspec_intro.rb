require 'rspec'
# main test
describe 'Payments' do
	# different types of payment
	context 'Mastercard payments' do

		num1 = 2
		num2 = 2

		# test to be runned for this payment type
		it 'two numbers are added together' do
			expect(num1 + num2).to eq 4
		end

	end

	context 'Visa payments' do

	end

end