namespace :twilio do
    desc "SEND_TEXT"
    task :send_text => :environment do
        twilio_text = TwilioClient.new
        UserAddedProduct.all.each do |p|
            p.relevant?
            twilio_text.send_text_to_self(p.user_id, p.id)
            p.recipients.all.each do |r|
                twilio_text.send_text(r.id, p.id)
            end
        end
    end
end