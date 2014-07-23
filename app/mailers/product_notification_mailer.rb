class ProductNotificationMailer < ActionMailer::Base
    default :from => "perishably@gmail.com"
  
  def notification_for(product)
    @product = product

    mail(:to => @product.user.email, :subject => "Perishably - Product Expiration Notice")
  end

  def test_email_for(email)
    @email = email

    mail(to: @email, :subject => "You're getting an email a minute.")
  end
end