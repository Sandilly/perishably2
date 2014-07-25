class UserAddedProduct < ActiveRecord::Base
  belongs_to :user
  has_many :recipients
  validates :name, :presence => true
  accepts_nested_attributes_for :recipients

  #before_save :set_expiration_date #, :set_notification_date

  def notify
    if self.user.notify?
      ProductNotificationMailer.notification_for(self).deliver
    end
  end

  def set_expiration_date
    
    time_add = self.number_unit_of_time.to_i
    time_type = self.unit_of_time_period
    
    # product_date_now = DateTime.now

    # product_date_now = self.created_at || DateTime.now
    
    if time_type =~ /\bday(|\(s\))?/i
      self.exp_date = product_date_now + time_add.days
    elsif time_type =~ /\bweek(|\(s\)?)/i
      self.exp_date = product_date_now + time_add.weeks
    elsif time_type =~ /\bmonth(|\(s\)?)/i
      self.exp_date = product_date_now + time_add.months
    elsif time_type =~ /\byear(|\(s\)?)/i
      self.exp_date = product_date_now + time_add.years
    else
      self.exp_date = self.unit_of_time_period
    end
  end

  def product_date_now
    if self.persisted?
      self.created_at 
    else
      DateTime.now
    end
  end

  def product_date_exp
    if self.persisted?
      self.exp_date
    else
      set_expiration_date
    end
  end

  def set_notification_date(unit, date_type)
    time_add = unit.to_i
    time_type = date_type
    
    if time_type =~ /\bday(|\(s\))?/i
      self.notification_date = product_date_exp - time_add.days
    elsif time_type =~ /\bweek(|\(s\)?)/i
      self.notification_date = product_date_exp - time_add.weeks
    elsif time_type =~ /\bmonth(|\(s\)?)/i
      self.notification_date = product_date_exp - time_add.months
    elsif time_type =~ /\byear(|\(s\)?)/i
      self.notification_date = product_date_exp - time_add.years
    else
      self.notification_date = product_date_exp
    end
  end

  def time_from_expiration
    binding.pry
    if DateTime.now < self.exp_date
      ( (self.exp_date - DateTime.now).to_i / (self.notification_date - DateTime.now).to_i )
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



# product_date_now + time_add.days
# product_date_now.+(time_add.days)
# product_date_now.send(:+, time_add.days)
# product_date_now.send(:+, time_add.send(:days))

# def change_days(operator, unit_of_time)
#   product_date_now.send(operator, time_add.send(unit_of_time))
# end

# change_days(:+, :days)
# change_days(:-, :weeks)
