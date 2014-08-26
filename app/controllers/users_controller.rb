class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    politician = Politician.find(params[:politician_id])
    @user.politicians << politician

    respond_to do |format|
      if @user.save
        # NotificationMailer.notify(@user, politician.notifications.last).deliver
        # send_twilio(@user, politician.notifications.last)
      else
      end
    end
  end

  def send_twilio(user, notification)
    account_sid = 'AC971d30fa136de2d68838e10144e2a867'
    auth_token = '5e56f633a54abb5012ccc774ef3a321b'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.calls.create({
      :to => user.phone,
      :from => '+12677513853',
      :url => "http://todeolho.herokuapp.com/call.xml?user_id=#{user.id}&amp;notification_id=#{notification.id}",
      :method => 'GET',
      :fallback_method => 'GET',
      :status_callback_method => 'GET',
      :record => 'false'
    })
  end


  private
    def user_params
      params[:user].permit(:name, :email, :phone)
    end
end
