// Load dependecies
var expect = require('chai').expect,
test = require('selenium-webdriver/testing'),
webdriver = require('selenium-webdriver');

// Our test
test.describe('Test', function () {
test.it('Should allow user to insert a car"', function () {
	// Set timeout to 10 seconds
	this.timeout(10000);

	// Get driver
	var driver = new webdriver.Builder().
	withCapabilities(webdriver.Capabilities.chrome()).
	build();

	// Go to URL
	driver.get('http://localhost:3333/cars');
	// Creates a new car using selenium
	driver.findElement(webdriver.By.xpath('//*[@id="bs-example-navbar-collapse-1"]/ul/li/a')).click();
	driver.findElement(webdriver.By.xpath('//*[@id="formButton"]/input[1]')).sendKeys("Boris 2.0");
	driver.findElement(webdriver.By.xpath('//*[@id="formButton"]/input[2]')).sendKeys("Mean lean yellow racing machine");
	driver.findElement(webdriver.By.xpath('//*[@id="formButton"]/input[3]')).sendKeys("https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj36dDx58DWAhXE6RQKHR3BAHIQjRwIBw&url=https%3A%2F%2Fwww.carthrottle.com%2Fpost%2Ffitting-a-duck-call-to-your-blow-off-valve-is-the-genius-modification-you-wish-youd-thought-of%2F&psig=AFQjCNEl3hWlXj5OKN5UFueV-11vTNFVag&ust=1506445214775902");
	driver.findElement(webdriver.By.id('buttons')).click();
	// Checks if new car has been created
	expect(driver.findElement(webdriver.By.xpath('//*[@id="blogTitle"]/div/h2')).text()).to.equal("Boris 2.0");
	expect(driver.findElement(webdriver.By.xpath('//*[@id="carsText"]/p')).text()).to.equal("Boris 2.0");
	// Find title and assert
	driver.executeScript('return document.title').then(function(return_value) {

 	// Quit webdriver
  	// driver.quit();
  });
});
});