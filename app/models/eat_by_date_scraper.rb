require 'pry-nav'
require "rest_client"
require 'nokogiri'
require 'yaml/store'

class EatByDateScraper 
	
	attr_reader :products_on_one_page, :links, :html, :homepath, :primary_selector, :response, :page, :allstudentlis, :info
	
	def initialize homepath 
		@homepath = homepath #a string starting with "http...""
	end

	def fetch(path)
		@response = RestClient.get(path)
		@html = Nokogiri::HTML(@response)
	end
	
	def get_links_from_home_page	
		noko = fetch(@homepath)
		@links = []
		noko.css('#primary-menu a').each do |i|
			item = i.attributes["href"].value
			@links << item
		end
	end

	def scrape_one_chart(url)
		noko = fetch(url)
		@products_on_one_page = []
		unless noko.css('#unopened').empty?
			tablenoko = noko.css('#unopened')
			storage_default = tablenoko.css('th')[1].text
			tablenoko.css('tr').each do |tr| 

			#break if tr.css('th') && tr.css('th')[0].text == "(Opened)"
				unless tr.css('td')[0] == nil || tr.css('td')[0].text == ""
					product = {}
					product["name"] = tr.css('strong').text
					product["time"] = tr.css('td')[1].text
					product["storage"] = storage_default
					@products_on_one_page << product
				end
			end
		end
		@products_on_one_page
	end
<<<<<<< HEAD
<<<<<<< HEAD
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

=======
>>>>>>> parent of 7f5d31f... working on eatbydate scraper
end

#should go in the rakefile under a task rake db:seeds
<<<<<<< HEAD

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
=======
c = EatByDateScraper.new("www.eatbydate.com/grains/cereal/cereal-shelf-life-expiration-date/")
cereals = c.get_products
t = EatByDateScraper.new("www.eatbydate.com/proteins/beans-peas/how-long-does-tofu-last-shelf-life/")
tofus=t.get_products
s = EatByDateScraper.new("www.eatbydate.com/drinks/how-long-does-coke-last-shelf-life-expiration-date/")
sodas= s.get_products

store = YAML::Store.new "../../db/eat_by_seeds.yml"
store.transaction do
  store["cereals"] = cereals
  store["tofus"] = tofus
  store["sodas"] = sodas
end
>>>>>>> parent of 7f5d31f... working on eatbydate scraper
=======


	def get_all_products
		get_links_from_home_page
		@products_on_all_pages = []
		@links.each do |url|
			products_per_page = scrape_one_chart(url)
			@products_on_all_pages << products_per_page
		end
		@products_on_all_pages
	end

	def store_data_in_yaml
		get_all_products
		all_products = @products_on_all_pages.flatten.flatten
		store = YAML::Store.new "db/eat_by_seeds.yml"
			store.transaction do
  		store[all_products] = "all_products"
		end
	end

end
>>>>>>> c96e8bfdec7538a4871f1ec14be42786ee1aea2d
