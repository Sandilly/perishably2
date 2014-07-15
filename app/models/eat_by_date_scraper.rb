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
		store = YAML::Store.new "db/eat_by_seeds.yaml"
			store.transaction do
  		store[all_products] = "all_products"
		end
	end

end
