require 'spec_helper'

describe 'Testing the budget app' do

  before(:all) do
    @driver = Appium::Driver.new(opts, true)
    # Allows for the use of rspec checks e.g. expect
    Appium.promote_appium_methods(RSpec::Core::ExampleGroup)
    @driver.start_driver
  end

  after(:all) do
    @driver.driver_quit
  end
  # set up above for Testing

  it "Should open the budgetwatch app" do
      expect(find_elements(:id, 'protect.budgetwatch:id/action_settings')[0].displayed?).to be true
  end

  it 'should have the budget option on the main landing page' do

  end

  it 'should access the budget page' do

    find_element(:id, 'protect.budgetwatch:id/menu').click

  end

  it 'should be able to add a budget' do
    find_element(:id, 'protect.budgetwatch:id/action_add').click
    find_element(:id, 'protect.budgetwatch:id/budgetNameEdit').send_keys('Boris 2.0')
    find_element(:id, 'protect.budgetwatch:id/valueEdit').send_keys(100000)

    # expect(find_element(:id, 'protect.budgetwatch:id/budgetName').text).to eql "Boris 2.0"
    # expect(find_element(:id, 'protect.budgetwatch:id/budgetValue').text).to eql "0/100000"
  end

end
