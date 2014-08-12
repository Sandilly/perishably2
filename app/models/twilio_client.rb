class TwilioClient
  SID = "AC209f7c1a9e533baccbe2b182277b4953"
  TOKEN = "268e317d14042838279b53112e67157b"
  TWILIO_NUMBER = "+16464801969"

  def initialize
    @client = Twilio::REST::Client.new(SID, TOKEN)
    @from = TWILIO_NUMBER
  end

  def notification_recipient_msg(user_id)
    notification = ""
    User.find(user_id).user_added_products.all.each do |user_added_product|
      user_added_product.recipients.all.each do |recipient|
        send_text(recipient.phone_number, user_added_product.id)
        send_text(User.find(user_id).phone_number, user_added_product.id)
      end
    end
  end

  def phone_number(recipient_id)
    Recipient.find(recipient_id).phone_number
  end

  def send_text_to_self(user_added_product_id)
    @client.account.sms.messages.create(
      :from => TWILIO_NUMBER,
      :to => UserAddedProduct.find(user_added_product_id).user.phone_number,
      :body => "This is your Perishab.ly alert. Your #{UserAddedProduct.find(user_added_product_id).name.downcase} will expire on #{UserAddedProduct.find(user_added_product_id).exp_date}."
      )
  end

  def send_text(user_added_product_id, recipient_id)
    @client.account.sms.messages.create(
      :from => TWILIO_NUMBER,
      :to => phone_number(recipient_id),
      :body => "This is your Perishab.ly alert. Your #{UserAddedProduct.find(user_added_product_id).name.downcase} will expire on #{UserAddedProduct.find(user_added_product_id).exp_date}."
      )
  end
end
