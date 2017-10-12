require 'rspec'
require 'pry'
require 'appium_lib'
require 'selenium-webdriver'

# require 'appium_capybara'

RSpec.configure do|config|
  config.color = true
  config.formatter = :documentation
end

def opts
  {caps:{
  "platformName": "Android",
  "deviceName": "emulator-5554",
  "browserName": "Chrome"
  }
}
end

