
require 'yaml'
require_relative 'eat_by_date'
require_relative 'scraper'

scraper = EatByDateScraper.new("http://www.eatbydate.com")
scraper.store_data_in_yaml

YAML.load(File.read('db/eat_by_seeds.yaml')).values.flatten.each do |p|
  product = Product.create(p)
end



makeup_array= []
scraper = Scraper.new("www.bellasugar.com/When-Throw-Makeup-Away-Guidelines-Cosmetic-Life-Span-1124422")
scraper.fetch

scraper.parse('.tiptable tr') do |element|
  item = {}
  next if element.css('td').empty?
  item[:name] =  element.css('td')[0].text
  item[:expiration] = element.css('td')[1].text
  makeup_array << item
end


makeup_array.each do |element|
  #[{:name => "mascara",:expiration => "12 months"}]
  # {:name => "mascara",:expiration => "12 months"}
  product = Product.new
  product.name = element[:name]
  product.expiration_date = element[:expiration]
  product.save
end