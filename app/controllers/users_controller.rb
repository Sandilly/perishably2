class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_added_products_path , notice: "Thanks for signing up!"
    else
      flash.now[:notice] = "Your submission is invalid."
      render "new"    
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   binding.pry
  #    @user = User.find(params[:id])

  #    @user.update(user_params)

  #     if @user.save
  #       redirect_to user_added_products_path, notice: "You have successfully updated you account."
  #     else 
  #       flash.now[:notice] = "Your submission is invalid."  
  #       render "edit"
  #     end
  # end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_number) 
  end
end
