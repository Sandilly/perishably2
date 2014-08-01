class TwilioClient
  SID = "AC209f7c1a9e533baccbe2b182277b4953"
  TOKEN = "268e317d14042838279b53112e67157b"
  TWILIO_NUMBER = "+16464801969"
  attr_reader :user_id

  def initialize(user_id)
    @user_id = user_id
    @client = Twilio::REST::Client.new(SID, TOKEN)
    @from = TWILIO_NUMBER
  end

  def notification_recipient_msg
    notification = ""
    User.find(@user_id).user_added_products.all.each do |user_added_product|
      user_added_product.recipients.all.each do |recipient|
        send_text(recipient.phone_number, user_added_product.id)
        send_text(User.find(@user_id).phone_number, user_added_product.id)
      end
    end
  end

  def send_text(phone_number, user_added_product_id)
    @client.account.sms.messages.create(
      :from => TWILIO_NUMBER,
      :to => phone_number,
      :body => "This is your Perishab.ly alert. Your #{User.find(@user_id).user_added_products.find(user_added_product_id).name.downcase} will expire on #{User.find(@user_id).user_added_products.find(user_added_product_id).exp_date}."
      )
  end
end
