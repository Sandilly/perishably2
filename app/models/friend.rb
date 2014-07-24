class Friend < ActiveRecord::Base
  belongs_to :user

  def notify
    if self.user.notify?
      ProductNotificationMailer.notification_for.deliver
    end
  end

end