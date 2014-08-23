class Notification < ActionMailer::Base
  default from: "from@example.com"

  def notify(user)
	mail(:to => user.email, :subject => "TÔ DE OLHO - Novidades do candidato")
  end
end
