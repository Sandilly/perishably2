namespace :twilio do
    desc "SEND_TEXT"
    task :send_text => :environment do
        twilio_text = TwilioClient.new
        UserAddedProduct.all.each do |p|
            if (p.notification_date.year == DateTime.now.year) && (p.notification_date.month == DateTime.now.month) && (p.notification_date.day == DateTime.now.day)
                twilio_text.send_text_to_self(p.user_id, p.id)
                p.recipients.all.each do |r|
                    twilio_text.send_text(r.id, p.id)
                end
            end
        end
    end
end