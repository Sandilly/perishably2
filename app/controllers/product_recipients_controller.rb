class ProductRecipientsController < ApplicationController

  # def new
  #   @product_recipient = ProductRecipient.new
  # end

  # def create
  #   @product_recipient = ProductRecipient.new(product_recipient_params)

  #   if @product_recipient.save
  #     @current_recipient.recipients << @product_recipient
  #     redirect_to product_recipients_path
  #   else 
  #     render :new
  #   end
  # end

  def index
    @product_recipients = ProductRecipient.all
  end

  # def edit
  #   @user_product = UserAddedProduct.find(params[:id])
  # end

  # def update
  #   @user_product = UserAddedProduct.find(params[:id])
  #   @user_product.assign_attributes(product_params)

  #   if @user_product.save
  #     redirect_to user_added_product_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @user_product = UserAddedProduct.find(params[:id])
  #   @user_product.destroy
  #   redirect_to user_added_products_path
  # end

  def show
    @user_product = UserAddedProduct.find(params[:id])


    @time_add = @user_product.number_unit_of_time.to_i
    @time_type = @user_product.unit_of_time_period

    @product_exp = @user_product.created_at
    
    if @time_type =~ /\bday(s|\(s\))?/i
      @exp_date = @product_exp + @time_add.days
    elsif @time_type =~ /\bweek(s|\(s\)?)/i
      @exp_date = @product_exp + @time_add.weeks
    elsif @time_type =~ /\bmonth(s|\(s\)?)/i
      @exp_date = @product_exp + @time_add.months
    elsif @time_type =~ /\byear(s|\(s\)?)/i
      @exp_date = @product_exp + @time_add.years
    else
      @exp_date = @user_product.unit_of_time_period
    end

  end

  # private

  # def product_params
  #   params.require(:user_added_product).permit(:name, :product_details, :unit_of_time_period, :number_unit_of_time,:storage)
  # end

end
