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
      current_user.recipients << recipient
      redirect_to user_added_products_path, notice:  "#{@recipient.name}.capitalizes will be notified on #{@product.exp_date.strftime("%B %d, %Y")} about #{@user_product.name}."
    else 
      render "user_added_products/show"
    end
  end  

  def show
    @recipients_stuff = @recipient.user_added_products
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
