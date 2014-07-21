class UserMailer < ActionMailer::Base
    default :from => "perishably@gmail.com"
  
  def product_notification(user)
    @user = user
    # @product = product
    
    mail(:to => @user.email, :subject => "Perishably notification")
  end
end

