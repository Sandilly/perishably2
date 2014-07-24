class FriendsController < ApplicationController

  def create
    @product = UserAddedProduct.find(params[:friend][:user_added_product_id])
    @friend = Friend.new(friend_params)
    # render text: params[:friend]
    if @friend.save
      current_user.friends << @friend
      redirect_to user_added_products_path, notice:  "#{@friend.name} will be notified on #{@product.exp_date.strftime("%B %d, %Y")} about #{@product.name}"
    else 
      render "user_added_products/show"
    end
  end  


  private
  def friend_params
    params.require(:friend).permit(:name, :email)
  end
end
