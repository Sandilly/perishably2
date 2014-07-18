class UserAddedProductsController < ApplicationController
  
  before_action :login_required

  def new
    @user_product = UserAddedProduct.new
  end

  def create
    @user_product = UserAddedProduct.new(product_params)

    if @user_product.save
      @current_user.user_added_products << @user_product
      redirect_to user_added_products_path
    else 
      render :new
    end
  end

  def index
    @product = UserAddedProduct.new
    
  end

  def edit
    @user_product = UserAddedProduct.find(params[:id])
  end

  def update
    @user_product = UserAddedProduct.find(params[:id])
    @user_product.assign_attributes(product_params)

    if @user_product.save
      redirect_to user_added_products_path
    else
      render :edit
    end
  end

  def destroy
    @user_product = UserAddedProduct.find(params[:id])
    @user_product.destroy
    redirect_to user_added_products_path
  end

  def show
    @user_product = UserAddedProduct.find(params[:id])
  end

  private

  def product_params
    params.require(:user_added_product).permit(:brand, :product_details, :length_of_time, :storage)
  end

end
