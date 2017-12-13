require 'nokogiri'
require_relative '../xml_parsing'

RSpec.configuration do |config|
  config.color = true
  config.formatter = :documentation
end
