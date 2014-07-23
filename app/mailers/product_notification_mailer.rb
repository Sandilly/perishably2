class ProductNotificationMailer < ActionMailer::Base
    default :from => "perishably@gmail.com"
  
  def notification_for(product)
    @product = product

    mail(:to => @product.user.email, :subject => "Perishably - Product Expiration Notice")
  end
end