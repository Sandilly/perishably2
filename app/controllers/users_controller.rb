class UsersController < ApplicationController
  before_filter :authenticate_user!
  # def new
  #     @user = User.new
  # end

  # def create
  #     @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to user_added_products_path #, notice: "Thanks for signing up!"
  #   else
  #     flash.now[:notice] = "Your submission is invalid."
  #     render "new"    
  #   end
  # end

  # private
  
  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :phone_number) 
  # end
end
