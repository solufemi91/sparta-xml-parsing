require 'nokogiri'

class GuiseppesMenu
  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_menu_names
    @menu.search('name')
  end

  def xpath_get_names
    @menu.xpath('//calories')
  end

  def xpath_get_nameOfFoods
    @menu.xpath('//name')
  end

  def xpath_get_nameOfFoodsNoTags
    @menu.xpath('//name').text
  end




end


x = GuiseppesMenu.new
# puts x.get_menu_names.last.text
puts x.get_menu_names
# puts x.get_menu_names[2].text
# puts x.xpath_get_names
# puts x.xpath_get_nameOfFoods
# puts x.xpath_get_nameOfFoodsNoTags
