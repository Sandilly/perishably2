class EatByDateScraper 
	
	attr_reader :products_on_one_page, :links, :html, :homepath, :primary_selector, :response, :page, :allstudentlis, :info
	
	def initialize  
		@homepath = "http://www.eatbydate.com"
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

	def ignore_category_called_substitutions
		@links.delete_if do |l|
			l.include?("substitutions") || l.include?("substitute")
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

def standardize_time(producthashes)
	results = []
	producthashes.each do |c|
		c["name"].strip!
		c["time"]=c["time"].gsub(/-\d+/, "")
		c["time"]=c["time"].gsub(/–\s?\d+/, "") 
		c["time"]=c["time"].gsub(/[+]/, "") 
		c["time"]=c["time"].gsub(/[*]/, "") 
		c["time"]=c["time"].gsub(/(same day)/i, "4 Hours") 
		if c["time"].match(/^(\S+\s){2}/)
			c["time"] = c["time"].match(/^(\S+\s){2}/)[0]
		end

		if c["time"]=~ /Year$/
			c["time"] = c["time"].gsub("Year", "Year(s)")
		elsif c["time"]=~ /Years$/
			c["time"] = c["time"].gsub("Years", "Year(s)")
		elsif c["time"]=~ /Day$/
			c["time"] = c["time"].gsub("Day", "Day(s)")
		elsif c["time"]=~ /Days$/
			c["time"] = c["time"].gsub("Days", "Day(s)")
		elsif c["time"]=~ /Month$/
			c["time"] = c["time"].gsub("Month", "Month(s)")
		elsif c["time"]=~ /Months$/
			c["time"] = c["time"].gsub("Months", "Month(s)")
		elsif c["time"]=~ /Week$/
			c["time"] = c["time"].gsub("Week", "Week(s)")
		elsif c["time"]=~ /Weeks$/
			c["time"] = c["time"].gsub("Weeks", "Week(s)")
		end
		results << c
	end
	results

end

def split_time(producthashes)
	producthashes.map do |c|
		c["time"] = c["time"].split
		if c["time"][0]
			c[:number_unit_of_time] = c["time"][0]
		end
		if c["time"][1]
			c[:unit_of_time_period] = c["time"][1].capitalize
		end
		c.delete("time")
	end
	producthashes
end

def delete_rows_without_time(producthashes)
	producthashes.delete_if do |c|
			#this isn't working 
			c["time"] == "–" || c["time"].include?("ndef") || c["time"] == "Indedinite"|| c["time"] == "-" || c["time"] =="use by date" || c["time"] =="best by date" || c["time"] =="Decades in a wine cellar"
		end
		producthashes
	end

	def delete_lasts_for(producthashes) 
		producthashes.each do |c|
			c["name"].gsub!(/(last)s?\s?(for)?/, "")
		end
	end

	def delete_trailing_space(producthashes)
		producthashes.each do |c|
			c["name"] = c["name"].rstrip
		end
	end
	
	def save_a_chart_to_activerecord_db(url)
		c = scrape_one_chart(url)
		c = delete_rows_without_time(c)
		c = standardize_time(c)
		c = split_time(c)
		c = delete_lasts_for(c)
		c = delete_trailing_space(c)
		c.each do |p|
			product = Product.create(p)
		end
	end

	def save_all_charts_to_active_record
		get_links_from_home_page
		ignore_category_called_substitutions
		@links.each do |l|
			save_a_chart_to_activerecord_db(l)
		end
	end

end
