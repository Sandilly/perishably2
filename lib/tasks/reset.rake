
# namespace :db do
#   desc "Reset the database and run both scrapers BY APRIL"
#   task :reset => :environment => :drop => :migrate => scraping:eat => db:seed do  
#   	rake db:drop
#   	rake db:migrate
#   	rake scraping:eat
#   	rake db:seed 
#   end
# end