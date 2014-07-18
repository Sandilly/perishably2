require_relative 'scraper.rb'
require 'nokogiri'
require 'rest-client'
require 'pry'

makeup_array= []
scraper = Scraper.new("www.bellasugar.com/When-Throw-Makeup-Away-Guidelines-Cosmetic-Life-Span-1124422")
scraper.fetch

scraper.parse('.tiptable tr') do |element|
  item = {}
  next if element.css('td').empty?
  item[:name] =  element.css('td')[0].text

  item[:storage] = "Keep in a cool and dry area"
  
  time_array= element.css('td')[1].text.split(" ")
  int_str = time_array[0].downcase #["18", "months"] ["one", "month"] ["12-18"- months] << checks for integers
  type_str = time_array[1].capitalize

  if int_str.to_i > 0
    item[:time] = int_str.to_i.to_s + " " + type_str
  else
    case int_str
      when "one"
        num = 1
        item[:time] = num.to_s + " " + type_str
      when "two"
        num = 2
        item[:time] = num.to_s + " " + type_str
      when "three"
        num = 3
        item[:time] = num.to_s + " " + type_str
      when "four"
        num = 4
        item[:time] = num.to_s + " " + type_str
      when "five"
        num = 5
        item[:time] = num.to_s + " " + type_str
      when "six"
        num = 6
        item[:time] = num.to_s + " " + type_str
      when "seven"
        num = 7
        item[:time] = num.to_s + " " + type_str
      when "eight"
        num = 8
        item[:time] = num.to_s + " " + type_str
      when "nine"
        num = 9
        item[:time] = num.to_s + " " + type_str
      when "ten"
        num = 10
        item[:time] = num.to_s + " " + type_str
      when "eleven"
        num = 11
        item[:time] = num.to_s + " " + type_str
      when "twelve"
        num = 12
        item[:time] = num.to_s + " " + type_str
      when "eleven"
        num = 11
        item[:time] = num.to_s + " " + type_str
      when "twelve"
            num = 12
        item[:time] = num.to_s + " " + type_str
      when "thirteen"
        num = 10
        item[:time] = num.to_s + " " + type_str
      when "fourteen"
        num = 14
        item[:time] = num.to_s + " " + type_str
      when "fifteen"
        num = 15
        item[:time] = num.to_s + " " + type_str
      when "sixteen"
        num = 16
        item[:time] = num.to_s + " " + type_str
      when "seventeen"
        num = 17
        item[:time] = num.to_s + " " + type_str
      when "eighteen"
        num = 18
        item[:time] = num.to_s + " " + type_str
      when "nineteen"
        num = 19
        item[:time] = num.to_s + " " + type_str
      when "twenty"
        num = 20
        item[:time] = num.to_s + " " + type_str
      else
        item[:time] = element.css('td')[1].text
    end
  end
  makeup_array << item

end


makeup_array.each do |element|
  #[{:name => "mascara",:expiration => "12 months"}]
  # {:name => "mascara",:expiration => "12 months"}
  product = Product.new
  product.name = element[:name]
  product.time = element[:time]
  # product.nickname = element[":nickname"]
  # product.brand = element[:brand]
  product.save
end



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