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

  def get_all_calorie_tags
     #get all the calorie tags, except the one that has a name sibling of breakfast
    #how do i select a tag that has a specific sibling
    calories_array = []
    @menu.xpath('//calories').each do |calories|
      calories_array << calories.text.to_i
    end

    calories_array

    # @menu.xpath("/breakfast_menu/food[not(name='Full Breakfast')]")


  end





  # Place your methods here

end

x = GuiseppesMenu.new
puts x.get_all_calorie_tags
# puts x.get_all_foods_except_breakfast
#
# class GuiseppesMenu
#   attr_accessor :menu
#
#   def initialize
#     @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
#   end
#
#   def get_menu_names
#     @menu.search('name')
#   end
#
#   def xpath_get_names
#     @menu.xpath('//calories')
#   end
#
#   def xpath_get_nameOfFoods
#     @menu.xpath('//name')
#   end
#
#   def xpath_get_nameOfFoodsNoTags
#     @menu.xpath('//name').text
#   end
#
#
#
#
# end
