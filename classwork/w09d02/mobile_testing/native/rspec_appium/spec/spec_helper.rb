require 'pry'
require 'appium_lib'

RSpec.configure do |config|
  config.formatter = :documentation
end

# def caps
#   {
#     "platformName": "Android",
#     "deviceName": "emulator-5554",
#     "app": "/Users/tech-a03/Downloads/budgetwatch.apk"
#   }
# end

def opts
        {
         caps: {
           platformName: "Android",
           deviceName: "emulator-5554",
           app: "/Users/tech-a03/Downloads/budgetwatch.apk"
         },
         appium_lib: {
           wait_timeout: 30,
           wait_interval: 1
         }
       }
end
