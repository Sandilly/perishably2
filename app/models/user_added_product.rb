class UserAddedProduct < ActiveRecord::Base
  belongs_to :user
  has_many :recipients, through: :product_recipients
  before_save :set_expiration_date, :set_notification_date

  def notify
    if self.user.notify?
      ProductNotificationMailer.notification_for(self).deliver
    end
  end

  def set_expiration_date
    time_add = self.number_unit_of_time.to_i
    time_type = self.unit_of_time_period

    product_exp = self.created_at
    
    if time_type =~ /\bday(s|\(s\))?/i
      self.exp_date = product_exp + time_add.days
    elsif time_type =~ /\bweek(s|\(s\)?)/i
      self.exp_date = product_exp + time_add.weeks
    elsif time_type =~ /\bmonth(s|\(s\)?)/i
      self.exp_date = product_exp + time_add.months
    elsif time_type =~ /\byear(s|\(s\)?)/i
      self.exp_date = product_exp + time_add.years
    else
      self.exp_date = self.unit_of_time_period
    end

    def set_notification_date

      notify
      self.notification_date = self.exp_date + 3.days
    end
  end


  # def exp_date(user_found)
  #   @time_add = @user_product.number_unit_of_time.to_i
  #   time_type = @user_product.unit_of_time_period

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
