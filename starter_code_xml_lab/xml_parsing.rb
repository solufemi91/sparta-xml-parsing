require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_all_prices_as_floats
    price_array = []
    @menu.xpath('//price').each do |price|
      price_array << price.text.gsub('£', '').to_f
    end

    price_array
  end

  def get_all_calorie_except_for_breakfast

    calories_array = []
    # @menu.xpath('//calories')
    @menu.xpath("//calories[not(.='1200')]").each do |calories|
      calories_array << calories.text.to_i
    end

    calories_array

  end


  #go through each food tag and check the description of each description tag
  def get_description_elements_for_waffles
    description_array = []
    @menu.xpath("//description[contains(text(),'waffles')]").each do |description|
      description_array.push(description.text)

    end
    description_array
  end




  # Place your methods here

end

# x = GuiseppesMenu.new
# puts x.get_description_elements_for_waffles
