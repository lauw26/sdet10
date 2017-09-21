describe "QA demo site can add item and checkout" do 

	before(:all) do
		# Instanciates capybara and registers a chrome browser 
		@capybara = Capybara_browser.new
		@capybara.register_browser(:chrome)
		#creates a chrome browser
		@chrome = Capybara::Session.new(:chrome)
	end
	# Mainly uses xpath which is not good
	it "Should open the QA demo store site" do
		@chrome.visit 'http://store.demoqa.com/'
	end

	it "Should go to third item on display" do
		@chrome.find(:xpath, '//*[@id="slide_menu"]/a[3]').click
	end

	it "Should be able to click on buy now button" do
		sleep(1)
		@chrome.find(:xpath, '//*[@id="slides"]/div[1]/div[3]/div/a/span').click
	end	

	it "Should add item to basket" do
		@chrome.find_button(class: 'wpsc_buy_button').click
	end

	it "Should click the checkout button after adding item to basket" do
		@chrome.find(:xpath, '//*[@id="fancy_notification_content"]/a[1]').click
	end	

	it "Should click continue checkout information" do
		@chrome.find(:xpath, '//*[@id="checkout_page_container"]/div[1]/a').click
	end
end

# Uses mainly css

# describe "checkout and pay for an item" do 

# 	before(:all) do
# 		@chrome = Capybara::Session.new(:chrome)
# 	end

# 	it "should access the " do
# 		@chrome.visit 'http://store.demoqa.com/'
# 	end

# 	it "should allow me to select a carousel object" do
# 		@chrome.all(:xpath, '//*[@id="slide_menu"]/a')[1].click
# 	end

# 	it "should allow me to click the buy now button for iphone" do
# 		@chrome.find('span', text: 'Buy Now').click
# 	end

# 	it "should allow me to click the add to cart button for iphone" do
# 		@chrome.find('.input-button-buy').click
# 	end

# 	it "should allow me to click go to checkout" do
# 		@chrome.find('.go_to_checkout').click
# 	end

# 	it "should allow me to continue with my payment" do
# 		@chrome.find('.step2').click
# 	end

# end
