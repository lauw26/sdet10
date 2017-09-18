require 'faker'
require 'selenium-webdriver'
require_relative '../form.rb'

RSpec.configure do|config|
  config.color = true
  config.formatter = :documentation
end