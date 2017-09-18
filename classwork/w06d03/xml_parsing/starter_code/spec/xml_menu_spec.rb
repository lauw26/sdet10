require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = Nokogiri::XML(File.read('xml_menu.xml'))
  end

  it "no price should be more than £10" do
  	@xml_menu.xpath('//price').each do |price|
  		expect(price.text.gsub("£","").to_f).to be <= 10
  	end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
  	@xml_menu.xpath('//food').each do |food|
  		if food.search('name').text != "Full Breakfast"
  			expect(food.search('calories').text.to_i).to be <= 1000
  		end
  	end
  end

  it "should have all waffle dishes stating you get two waffles" do
  	@xml_menu.xpath('//food').each do |food|
  		if food.search('name').text.downcase.include? "Waffles"
  			expect(food.search('description').text.downcase).to include("two")
  		end
  	end
  end


end