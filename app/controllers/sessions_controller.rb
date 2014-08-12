class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to user_added_products_path
    end
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_added_products_path
    else
      flash.now[:notice] = "Email or Password is invalid."  
      render "new"    
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Sucessfully logged out."
  end

end

