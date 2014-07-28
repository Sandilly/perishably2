class ProductNotificationMailer < ActionMailer::Base
    
    default :from => "perishably@gmail.com" #fluffhead is the password

  def notification_for(product)
  	@product = product 
    mail(:to => @product.user.email, :subject => "Perishab.ly alert regarding your #{@product.name}")
  end

  def test_email_for(email)
    @email = email

    mail(to: @email, :subject => "You.")
  end
end