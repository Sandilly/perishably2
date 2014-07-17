class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to products_path, notice: "Thanks for signing up!"
    else
      render "new" 
      flash[:notice] = "Your submission is invalid."
      
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password) 
  end
end
