require 'capybara/cucumber'
require 'site_prism'
require 'pry'
require 'active_support'

ActiveSupport::Dependencies.autoload_paths << File.join(Dir.pwd, 'lib')

Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
	config.ignore_hidden_elements = false
	config.default_max_wait_time = 10
	config.default_driver = :chrome
end
