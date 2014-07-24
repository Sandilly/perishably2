class UserAddedProductsController < ApplicationController
  
  before_action :login_required

  def new
    @user_product = UserAddedProduct.new
  end

  def create
    @user_product = UserAddedProduct.new(product_params)
    @user_product.set_expiration_date
    @user_product.set_notification_date(params[:notify_num], params[:notify_date_type])

    @time_add = @user_product.unit_of_time_period.split(" ")[0].to_i
    @time_type = @user_product.unit_of_time_period.split(" ")[1]

    @current_date = DateTime.now
    if @time_type =~ /\bday(|\(s\))?/i
      @user_product.exp_date = @current_date + @time_add.days
    elsif @time_type =~ /\bweek(|\(s\)?)/i
      @user_product.exp_date = @current_date + @time_add.weeks
    elsif @time_type =~ /\bmonth(|\(s\)?)/i
      @user_product.exp_date = @current_date + @time_add.months
    elsif @time_type =~ /\byear(|\(s\)?)/i
      @user_product.exp_date = @current_date + @time_add.years
    else
      @user_product.exp_date = @user_product.unit_of_time_period
    end
    if @user_product.save
      current_user.user_added_products << @user_product
      ProductNotificationMailer.notification_for(@user_product).deliver
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
    @user_product.set_expiration_date
    @user_product.set_notification_date(params[:notify_num], params[:notify_date_type])
    

    if @user_product.save
      redirect_to user_added_product_path
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
    @friend = Friend.new
    @time_left = @user_product.exp_date / @user_product.notification_date
  end

  private

  def product_params
    params.require(:user_added_product).permit(:name, :product_details, :unit_of_time_period, :number_unit_of_time, :storage)
  end

end


