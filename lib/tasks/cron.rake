namespace :cron do
  desc "fire test run for chronjobs"
  task :test_msg => :environment do
    puts "firing now"
    ProductNotificationMailer.test_email_for("alichtbros@gmail.com").deliver
  end
end