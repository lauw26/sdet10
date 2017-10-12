require 'appium_lib'
require 'appium_capybara'
require 'capybara/cucumber'
require 'pry'

# The below line of code now means that the chrome driver is registered before every run.
# Any query stated at the top level of the env.rb file will be initiated at every cucumber run

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,:browser => :chrome)
end

Capybara.configure do |config|
  config.ignore_hidden_elements = false # to ensure that all hidden elements on a page are recorded/available
  config.default_max_wait_time= 10 # wait time for asynchronus processes to finsh
  config.match = :prefer_exact # this setting is to ensure Capybara has specific matching rather than fuzzy logic
  config.default_driver = :chrome # ensures chrome is the default driver
  config.app_host = 'http://toolsqa.com/automation-practice-form/' # provides the app host/core url
end

if ENV['chrome']
  Capybara.default_driver = :chrome
elsif ENV['appium']
  android_caps = {
    deviceName:      "emulator-5554",
    platformName:    "Android",
    browserName:     "Chrome",
  }

  url = "http://localhost:4723/wd/hub" # or a sauce labs url

  Capybara.register_driver(:appium) do |app|
      appium_lib_options = {
        server_url:           url
      }
      all_options = {
        appium_lib:  appium_lib_options,
        caps:        android_caps
      }
      Appium::Capybara::Driver.new(app, all_options)
  end
  Capybara.default_driver = :appium
end
