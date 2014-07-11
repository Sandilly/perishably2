# require_relative 'scraper.rb'
# require 'nokogiri'
# require 'rest-client'
# require 'pry'


# makeup_array= []
# scraper = Scraper.new("www.bellasugar.com/When-Throw-Makeup-Away-Guidelines-Cosmetic-Life-Span-1124422")
# scraper.fetch

# scraper.parse('.tiptable tr') do |element|
#   item = {}
#   next if element.css('td').empty?
#   item[:name] =  element.css('td')[0].text
#   item[:expiration] = element.css('td')[1].text
#   makeup_array << item
# end

# # store = YAML::Store.new "cosmetic.store"

# # store.transaction do
# #   store["cosmetics"] = @makeup_hash
# # end  

# # f = File.open("cosmetic.store", "r")

# makeup_array.each do |element|
#   element.each do |key, value|
#     product = Product.new
#     product.name = key
#     product.expiration_date = value
#     product.save
#   end
# end