require 'spec_helper'

describe 'Im going to test stuff' do

  caps = {
      :platformName => 'Android',
      :deviceName => 'emulator-5554',
      :browserName => 'Chrome'
  }

	before(:all) do
    Appium::Driver.new(opts, true)
    Appium.promote_appium_methods(RSpec::Core::ExampleGroup)
    @selenium_driver = $driver.start_driver
	end

	after(:all) do
		$driver.driver_quit
	end

  it 'should open bbc page' do
    @selenium_driver.get('https://bbc.co.uk')
    expect(@selenium_driver.current_url).to eq 'https://www.bbc.co.uk/'
    binding.pry
  end

end
