require_relative 'scraper.rb'

@makeup_hash= {}
scraper = Scraper.new("www.bellasugar.com/When-Throw-Makeup-Away-Guidelines-Cosmetic-Life-Span-1124422")
scraper.fetch

scraper.parse('.tiptable tr') do |element|
  next if element.css('td').empty?
    
  @name =  element.css('td')[0].text
  @expiration = element.css('td')[1].text
  
  @makeup_hash[@name] = @expiration
  binding.pry
end

# store = YAML::Store.new "cosmetic.store"

# store.transaction do
#   store["cosmetics"] = @makeup_hash
# end  

# f = File.open("cosmetic.store", "r")

# f['cosmetics'].each do |key, val|
#   product = Product.new
#   product.name = key
#   product.expiration_date = val
#   binding.pry
#   product.save
# end