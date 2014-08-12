namespace :twilio do
	desc "SEND_TEXT"
	task :send_text => :environment do
		UserAddedProduct.all.each do |p|
			p.recipients.each do |r|
				if (p.notification_date.year == DateTime.now.year) && (p.notification_date.month == DateTime.now.month) && (p.notification_date.day == DateTime.now.day)
					twilio_text = TwilioClient.new
					twilio_text.send_text(p.id, r.id)
					twilio_text.send_text_to_self(p.id)
				end
			end
		end
	end
end
