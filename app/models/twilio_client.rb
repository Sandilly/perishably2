class TwilioClient
  SID = "AC209f7c1a9e533baccbe2b182277b4953"
  TOKEN = "268e317d14042838279b53112e67157b"
  TWILIO_NUMBER = "+16464801969"

  def initialize
    @client = Twilio::REST::Client.new(SID, TOKEN)
    @from = TWILIO_NUMBER
  end

  def notification_recipient_msg(user_id)
    # notification = ""
    User.find(user_id).user_added_products.all.each do |user_added_product|
      user_added_product.recipients.all.each do |recipient|
        send_text(user_added_product.id, recipient.id)
        send_text_to_self(user_added_product.id)
      end
    end
  end

  def phone_number(recipient_id)
    Recipient.find(recipient_id).phone_number
  end

  def self_phone_number(user_id)
    User.find(user_id).phone_number
  end

  def message(user_added_product_id)
    "This is your Perishab.ly alert. Your #{UserAddedProduct.find(user_added_product_id).name.downcase} will expire on #{UserAddedProduct.find(user_added_product_id).exp_date}."
  end

  def send_text_to_self(user_id, user_added_product_id)
    @client.account.sms.messages.create(
      :from => TWILIO_NUMBER,
      :to => self_phone_number(user_id),
      :body => message(user_added_product_id)
      )
  end

  def send_text(recipient_id, user_added_product_id)
    @client.account.sms.messages.create(
      :from => TWILIO_NUMBER,
      :to => phone_number(recipient_id),
      :body => message(user_added_product_id)
      )
  end
end
