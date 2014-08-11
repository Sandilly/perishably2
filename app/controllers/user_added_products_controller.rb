class UserAddedProductsController < ApplicationController

  before_action :login_required

  def new
    @user_product = UserAddedProduct.new
    @user_product.email = true
  end

  def create
    @user_product = UserAddedProduct.new(product_params)
    @user_product.recipients.delete_all
    if !params[:user_added_product][:recipients_attributes]
      current_user.user_added_products << @user_product
    else
      params[:user_added_product][:recipients_attributes].each_with_index do |recipient, index|
        if @recipient = Recipient.find_by(:email => params[:user_added_product][:recipients_attributes][index][:email])
           @recipient.update(:phone_number => params[:user_added_product][:recipients_attributes][index][:phone_number])
           @recipient.save
           @user_product.recipients << @recipient
           current_user.user_added_products << @user_product
         else
           @recipient = Recipient.new(product_params[:recipients_attributes][index])
           @recipient.save
           @user_product.recipients << @recipient
           current_user.user_added_products << @user_product
        end
      end
    end
    if @user_product.save
      redirect_to user_added_product_path(@user_product)
    else
      flash.now[:notice] = "Please add notification recipient(s)."
      render :new
    end
  end
  def index
    @products = current_user.user_added_products
  end

  def edit
    @user_product = UserAddedProduct.find(params[:id])
  end

  def update
    @user_product = UserAddedProduct.find(params[:id])
    @create_date = @user_product.created_at.strftime("%Y-%m-%d")
    if !params[:user_added_product][:recipients_attributes]
      @user_product.assign_attributes(product_params)
    else 
      params[:user_added_product][:recipients_attributes].each_with_index do |recipient, index|
        if @recipient = Recipient.find_by(:email => params[:user_added_product][:recipients_attributes][index][:email])
           @recipient.update(:phone_number => params[:user_added_product][:recipients_attributes][index][:phone_number])
           @recipient.save
           @user_product.recipients << @recipient
           current_user.user_added_products << @user_product
        else
           @recipient = Recipient.new(product_params[:recipients_attributes][index])
           @recipient.save
           # @user_product.assign_attributes(product_params)
           @user_product.recipients << @recipient
           current_user.user_added_products << @user_product
        end
      end
    end
    if @user_product.save
      redirect_to user_added_product_path(@user_product)
    else
      redirect_to user_added_product_path(@user_product), notice: "Please try again."
    end
  end
  def destroy
    @user_product = UserAddedProduct.find(params[:id])
    @user_product.destroy
    redirect_to user_added_products_path
  end

  def show
    @user_product = UserAddedProduct.find(params[:id])
    @create_date = @user_product.created_at.strftime("%Y-%m-%d")
    @time_add = @user_product.number_unit_of_time.to_i
    @time_type = @user_product.unit_of_time_period
    @product_exp = @user_product.created_at
  end

  private

  def product_params 
    params.require(:user_added_product).permit(:name,
    :email, :notification_date, :sms, :product_details,
    :unit_of_time_period, :number_unit_of_time, :exp_date, :storage,
    :recipients_attributes =>[:id, :name, :email, :phone_number])      
  end

end
