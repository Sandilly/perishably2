namespace :cron do
	desc "fire test run for chronjobs"
	task :test_msg => :environment do
		UserAddedProduct.all.each do |p|
			if (p.notification_date.year == DateTime.now.year) && (p.notification_date.month == DateTime.now.month) && (p.notification_date.day == DateTime.now.day)
				ProductNotificationMailer.notification_for(p).deliver
			end
		end
	end

#first test new whenever rake task that includes both
#then test it on heroku
  desc "auto-delete expired items"
  task :auto_delete => :environment do
    UserAddedProduct.all.each do |p|
      if (p.exp_date.year == DateTime.now.year) && (p.exp_date.month == DateTime.now.month) && (p.exp_date.day == DateTime.now.day)
        p.destroy
      end
    end
  end
end
