namespace :twilio do
  desc "SEND_TEXT"
  task send_text: :environment do
    User.all.each do |user|
      user.user_added_products.all.each do |product|
        twilio_text = TwilioClient.new(user, product)
        twilio_text.send_text
      end
    end
  end
end
