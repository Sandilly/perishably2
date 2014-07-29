
namespace :scraping do
  desc "Scrape EatByDate.com and save to Products table"
  task :eat => :environment do
  	scraper = EatByDateScraper.new
  	#scraper.save_a_chart_to_activerecord_db("http://www.eatbydate.com/other/sweets/how-long-do-marshmallows-last/")
		scraper.save_all_charts_to_active_record
  end
end

