class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"

  def notify(user, notification)
  	@user = user
  	@notification = notification
	mail(:to => user.email, :subject => "TÔ DE OLHO - Novidades do candidato")
  end
end
