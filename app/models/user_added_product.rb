class UserAddedProduct < ActiveRecord::Base
  belongs_to :user
  has_many :recipients, through: :product_recipients

  # def exp_date(user_found)
  #   @time_add = @user_product.number_unit_of_time.to_i
  #   @time_type = @user_product.unit_of_time_period

  #   @product_exp = @user_product.created_at
    
  #   if @time_type =~ /\bday(s|\(s\))?/i
  #     @exp_date = @product_exp + @time_add.days
  #   elsif @time_type =~ /\bweek(s|\(s\)?)/i
  #     @exp_date = @product_exp + @time_add.weeks
  #   elsif @time_type =~ /\bmonth(s|\(s\)?)/i
  #     @exp_date = @product_exp + @time_add.months
  #   elsif @time_type =~ /\byear(s|\(s\)?)/i
  #     @exp_date = @product_exp + @time_add.years
  #   else
  #     @exp_date = @user_product.unit_of_time_period
  #   end
  # end

  
end
