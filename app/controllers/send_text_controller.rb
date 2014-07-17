class SendTextController < ApplicationController
  def index
  end
  
  def send_text_message
    number_to_send_to = params[:number_to_send_to]
    
    twilio_sid = "AC209f7c1a9e533baccbe2b182277b4953"
    twilio_token = "268e317d14042838279b53112e67157b"
    twilio_phone_number = "16464801969"
    
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is a Perishab.ly notification regarding your #{name}, which will expire in #{time}."
      )
  end
end