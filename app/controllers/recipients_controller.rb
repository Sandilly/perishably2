class RecipientsController < ApplicationController
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
      redirect_to user_added_products_path
    else
      render "user_added_products/show"
    end
  end

  def update
    @user_product = UserAddedProduct.find(params[:user_added_product_id])
    @recipient = Recipient.find(params[:id])
    @recipient.update(recipient_params)
    if @recipient.save  
      redirect_to user_added_product_path(@user_product), notice:  "#{@recipient.name.capitalize} has been updated."
    else
      render :edit
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

  def edit
    @user_product = UserAddedProduct.find(params[:user_added_product_id])
    @recipient = Recipient.find(params[:id])
  end

  def destroy
    @user_product = UserAddedProduct.find(params[:user_added_product_id])
    @recipient = Recipient.find(params[:id])
    @recipient.destroy
    redirect_to user_added_product_path(@user_product)
  end

  private

  def find_objects
    @user_product = UserAddedProduct.find(params[:user_added_product_id])
    @recipient = Recipient.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:name, :email, :phone_number)
  end
end
