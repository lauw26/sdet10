class MainPage

  BUDGET_AND_TRANSACTION_ID= 'protect.budgetwatch:id/action_settings'

  def initialize(driver)
    @driver = driver
  end

  def main_page_displayed?
    @driver.find_elements(:id, BUDGET_AND_TRANSACTION_ID)
  end

end
