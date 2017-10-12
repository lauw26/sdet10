require_relative 'pages/main_page'

module BudgetApp

  def mainpage
    MainPage.new($driver)
  end


end
