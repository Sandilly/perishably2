namespace :twilio do
	desc "SEND_TEXT"
	task send_text: :environment do
		User.all.each do |user|
			user.user_added_products.all.each do |p|
					binding.pry
				if (p.notification_date.year == DateTime.now.year) && (p.notification_date.month == DateTime.now.month) && (p.notification_date.day == DateTime.now.day)
					twilio_text = TwilioClient.new(user, p)
					twilio_text.send_text

				end
			end
		end
	end
end
