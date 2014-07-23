class UserAddedProduct < ActiveRecord::Base
  belongs_to :user
  has_many :recipients, through: :product_recipients

  def notify
    if self.user.notify?
      ProductNotificationMailer.notification_for(self).deliver
    end
  end
end
