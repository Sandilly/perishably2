require 'pry-nav'
require "rest_client"
require 'Nokogiri'
require 'yaml/store'
class EatByDateScraper 
	attr_reader :html, :path, :primary_selector, :response, :page, :allstudentlis, :info
	def initialize path 
		@path = "http://#{path}"
		#http://www.eatbydate.com/dairy/ice-cream-shelf-life-expiration-date/
	end
	def fetch
		@response = RestClient.get(@path)
		@html = Nokogiri::HTML(@response)
	end
	def get_products
		noko = self.fetch
		tablenoko = noko.css('#unopened')
		products = []
		storage_default = tablenoko.css('th')[1].text
		
		tablenoko.css('tr').each do |tr| 
			#break if tr.css('th') && tr.css('th')[0].text == "(Opened)"
			unless tr.css('td')[0] == nil || tr.css('td')[0].text == ""
				product = {}
				product["name"] = tr.css('strong').text
				product["time"] = tr.css('td')[1].text
				product["storage"] = storage_default
				products << product
			end
		end
		products
	end
<<<<<<< HEAD
end

#should go in the rakefile under a task rake db:seeds
c = EatByDateScraper.new("www.eatbydate.com/grains/cereal/cereal-shelf-life-expiration-date/")
cereals = c.get_products
t = EatByDateScraper.new("www.eatbydate.com/proteins/beans-peas/how-long-does-tofu-last-shelf-life/")
tofus=t.get_products
s = EatByDateScraper.new("www.eatbydate.com/drinks/how-long-does-coke-last-shelf-life-expiration-date/")
sodas= s.get_products

<<<<<<< HEAD
store = YAML::Store.new "../../db/eat_by_seeds.yml"
store.transaction do
  store["cereals"] = cereals
  store["tofus"] = tofus
  store["sodas"] = sodas
end
=======


def get_all_products
	@products_on_all_pages = []
	@links.each do |url|
		products_on_a_page = scrape_one_chart(url)
		@products_on_all_pages << products_on_a_page
	end
	binding.pry
end

=======
def get_all_products
	@products_on_all_pages = []
	@links.each do |url|
		products_on_a_page = scrape_one_chart(url)
		@products_on_all_pages << products_on_a_page
	end
	binding.pry
end

>>>>>>> parent of c96e8bf... almost done with eatbyscraper
	#iterate through the array, 
	#instantiate EatByScraper.new on each item in array
	#run get_products on each item in array
	#store it in YAML--
	#put it all in the same class

end

scraper = EatByDateScraper.new("http://www.eatbydate.com")
scraper.get_links_from_home_page
scraper.get_all_products

#should go in the rakefile under a task rake db:seeds

# store = YAML::Store.new "../../db/eat_by_seeds.yml"
# store.transaction do
#   store["cereals"] = cereals
#   store["tofus"] = tofus
#   store["sodas"] = sodas
# end

# require 'pry-nav'
# require 'mechanize'
# require 'nokogiri'




# agent = Mechanize.new
# page = agent.get("http://www.eatbydate.com")
# endlinks = []
# page.search('#primary-menu')
# agent.click("http://www.eatbydate.com/dairy/cheese/cheese-shelf-life-expiration-date/")
# binding.pry
# agent.page.search(".edit_item").each do |item|
#   Product.create!(:name => item.text.strip)
# end

<<<<<<< HEAD
>>>>>>> parent of c96e8bf... almost done with eatbyscraper
=======
>>>>>>> parent of c96e8bf... almost done with eatbyscraper
