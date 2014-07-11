# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

environment = ENV['RACK_ENV'] || 'development'
dbconfig    = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig[environment]

#Load All models 
Dir.glob("./app/models/*").each do |file|
  require file 
end

#Now use Active record as you normally would
# @user = User.create( :name => 'Dave' )
# @user.save
# @first_person = User.first