class RecipientsController < ApplicationController
  belongs_to :user
  before_action :find_objects, only: [:show]

  def new
      @user_product = UserAddedProduct.find(params[:user_added_product_id])
      @recipient = Recipient.new
  end

  def create
    @product = UserAddedProduct.find(params[:recipient][:user_added_product_id])
    @recipient = Recipient.new(recipient_params)
    if @recipient.save
      current_user.recipients << @recipient
      redirect_to user_added_products_path, notice:  "#{@recipient.name}.capitalize will be notified on #{@product.exp_date.strftime("%B %d, %Y")} about #{@user_product.name}."
    else 
      render "user_added_products/show"
    end
  end  

  def show
    @recipients_stuff = @recipient.user_added_products
  end

  def notify
    if self.user.notify?
      ProductNotificationMailer.notification_for.deliver
    end
  end

  private
  
  def find_objects
    @user_product = UserAddedProduct.find(params[:user_added_product_id])
    @recipient = Recipient.find(params[:id])
  end

  def product_params
    params.require(:user_added_product).permit(:name, :email, :notification_date, :sms, :product_details, :unit_of_time_period, :number_unit_of_time, :exp_date, :storage, :recipients_attributes =>[:id, :name, :email, :phone_number])
  end
end
