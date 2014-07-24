class RecipientsController < ApplicationController
  before_action :find_objects, only: [:show]

  def new
      @user_product = UserAddedProduct.find(params[:user_added_product_id])
      @recipient = Recipient.new
  end

  # def create
  #     user_product = UserAddedProduct.find(params[:user_added_product_id])
  #     binding.pry
  #     if recipient = Recipient.find_by(email: params[:email])
  #       user_product.recipients << recipient
  #     else
  #       recipient = Recipient.new(recipient_params)
  #       user_product.recipients << recipient
  #     end
  #   if recipient.save
  #     redirect_to user_added_products_path
  #   else
  #     flash.now[:notice] = "Your submission is invalid."
  #     render "new"    
  #   end
  # end

  def show
    @recipients_stuff = @recipient.user_added_products
  end

  # def search 
  #   @recipient = Recipient.find_by(id: params[:id])
  #   respond_to do |format|
  #     format.json {render json: @recipient}
  #   end
  # end

  private
  
  def find_objects
    @user_product = UserAddedProduct.find(params[:user_added_product_id])
    @recipient = Recipient.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:name, :email, :phone_number) 
  end
end
