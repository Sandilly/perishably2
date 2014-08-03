class UserAddedProductsController < ApplicationController

  before_action :login_required

  def new
    @user_product = UserAddedProduct.new
    @user_product.email = true
  end

  def create
    @user_product = UserAddedProduct.new(product_params)
    recipient_attributes = params[:user_added_product][:recipients_attributes]
    if recipient_attributes
      if recipient_attributes.count > 0
        recipient_attributes.each_with_index do |recipient, index|

          if @recipient = Recipient.find_by(:email => recipient_attributes[index][:email])
            @user_product.recipients << @recipient #add recipient
          else
            #create the non-existent recipient
            #then add it.
          end
        end
      end
    end
    current_user.user_added_products << @user_product
    if @user_product.save
      redirect_to user_added_product_path(@user_product)
    else
      flash.now[:notice] = "Please try again."
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

    if params[:user_added_product][:recipients_attributes].count > 0
      params[:user_added_product][:recipients_attributes].each_with_index do |recipient, index|
        if @recipient = Recipient.find_by(:email => params[:user_added_product][:recipients_attributes]["0"][:email])
          if @user_product.recipients.include?(@recipient)
            flash.now[:notice] = "You have already added this recipient."
          else
            if @user_product.save
              @user_product.assign_attributes(product_params)
              redirect_to user_added_product_path(@user_product) and return
            else
              render :edit
            end
          end
        end
      end
        #if @recipient = Recipient.find_by(:email => recipient_attributes[index][:email])
    end
  
  end










  #       if @recipient = Recipient.find_by(:email => params[:user_added_product][:recipients_attributes]["0"][:email])
  #         if @user_product.recipients.include?(@recipient)
  #           flash.now[:notice] = "You have already added this recipient."
  #         else
  #           @user_product.recipients << @recipient
  #         end
  #       else
  #         @user_product.assign_attributes(product_params)
  #       end
  #     end
  #   else
  #     @user_product.assign_attributes(product_params)
  #   end
  #   if @user_product.save
  #     redirect_to user_added_product_path(@user_product)
  #   else
  #     flash.now[:notice] = "Your submission is invalid."
  #     render "edit"
  #   end
  # end

   def destroy
>>>>>>> refactored progressbar.js
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
    params.require(:user_added_product).permit(:name, :email, :notification_date, :sms, :product_details, :unit_of_time_period, :number_unit_of_time, :exp_date, :storage, :recipients_attributes =>[:id, :name, :email, :phone_number])
  end
end
