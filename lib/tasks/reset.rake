
namespace :db do
  desc "Reset the database and run both scrapers BY APRIL"
  task :reset => :environment do  
		Rake::Task['db:drop'].invoke
		Rake::Task['db:create'].invoke	
		Rake::Task['db:migrate'].invoke	
		Rake::Task["scraping:eat"].invoke
		Rake::Task["db:seed"].invoke
	end
end