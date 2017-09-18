require 'selenium-webdriver'
require 'faker'
class Form

	def initialize
		Selenium::WebDriver::Chrome.driver_path = '/usr/local/bin/chromedriver'
		@chrome_driver = Selenium::WebDriver.for :chrome

		# page objects
		@pratice_form_url = "http://toolsqa.com/automation-practice-form/"
		# waiting for elements to load
		@wait = Selenium::WebDriver::Wait.new(:timeout => 5)
	end

	def access_pratice_form
		@chrome_driver.get @pratice_form_url 
	end

	def add_first_name(first_name)
		@wait.until{@chrome_driver.find_element(:name, 'firstname').displayed?}
		@chrome_driver.find_element(:name, 'firstname').send_keys(first_name)
	end

	def add_last_name(last_name)
		@wait.until{@chrome_driver.find_element(:name, 'lastname').displayed?}
		@chrome_driver.find_element(:name, 'lastname').send_keys(last_name)
	end

	def add_gender(gender)
		if gender == "male" 
			@chrome_driver.find_element(:id, 'sex-0').click
		elsif gender == "female"
			@chrome_driver.find_element(:id, 'sex-1').click
		else
			raise "Enter male or female"
		end
	end

	def add_experience(years)
		case years

			when 1
				@chrome_driver.find_element(:id, 'exp-0').click
			when 2 
				@chrome_driver.find_element(:id, 'exp-1').click
			when 3 
				@chrome_driver.find_element(:id, 'exp-2').click
			when 4
				@chrome_driver.find_element(:id, 'exp-3').click
			when 5 
				@chrome_driver.find_element(:id, 'exp-4').click
			when 6
				@chrome_driver.find_element(:id, 'exp-5').click
			when 7
				@chrome_driver.find_element(:id, 'exp-6').click
			else
				raise "Enter a number between 1 and 7"
		end

	end

	def add_date(date)
		@wait.until{@chrome_driver.find_element(:id, 'datepicker').displayed?}
		@chrome_driver.find_element(:id, 'datepicker').send_keys(date)
	end

	def add_profession(profession)
		if profession == "mt" 
			@chrome_driver.find_element(:id, 'profession-0').click
		elsif profession == "at"
			@chrome_driver.find_element(:id, 'profession-1').click
		else
			raise "Enter mt for manual tester or at for automation tester"
		end
	end

	# joe has drop down box working contact joe for info
end


@form = Form.new
@form.access_pratice_form
@form.add_first_name(Faker::Name.first_name)
@form.add_last_name(Faker::Name.last_name)
@form.add_gender('male')
@form.add_experience(6)
@form.add_date("18/12/13")
@form.add_profession("at")

