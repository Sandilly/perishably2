class TwilioClient
  SID = "AC209f7c1a9e533baccbe2b182277b4953"
  TOKEN = "268e317d14042838279b53112e67157b"
  TWILIO_NUMBER = "+16464801969"
    
  def initialize(user, product)
    @user = user
    @product = product
  end

  def send_text
    twilio_client = Twilio::REST::Client.new(SID, TOKEN)
    
    twilio_client.account.sms.messages.create(
      :from => TWILIO_NUMBER,
      :to => @user.phone_number,
      :body => "This is a Perishab.ly notification regarding your #{@product.name}, which will expire in #{@product.time}."
      )
  end
end