namespace :daily do 
	desc "send sms and emails"
	task :notify_both => :environment do
		UserAddedProduct.all.each do |p|
			if (p.notification_date.year == DateTime.now.year) && (p.notification_date.month == DateTime.now.month) && (p.notification_date.day == DateTime.now.day)
				if p.email == true
					ProductNotificationMailer.notification_for(p).deliver
				end
				if p.sms == true
					user = p.user
					twilio_text = TwilioClient.new(user, p)
					twilio_text.send_text
				end
			end
		end
	end
end