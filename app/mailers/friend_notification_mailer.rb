class FriendNotificationMailer < ActionMailer::Base
  default :from => "perishably@gmail.com"
  
  def notification_for(product)
    @product = product

    mail(:bcc => @product.user.friends.map {|friend| friend.email}, :subject => "#{@product.user.name} sent you a Perishably Expiration Notice").deliver
  end

  def test_email_for(email)
    @email = email

    mail(to: @email, :subject => "You're getting an email a minute.")
  end
end