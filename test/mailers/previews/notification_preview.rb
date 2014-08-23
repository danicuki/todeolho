# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  def notify
    Notification.notify(User.first)
  end
end
