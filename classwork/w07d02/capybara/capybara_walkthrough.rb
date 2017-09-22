require 'capybara'

class Capybara_browser

	def register_browser(browser)
		Capybara.register_driver browser do |app|
			Capybara::Selenium::Driver.new(app, :browser => browser)
		end

	end

end

