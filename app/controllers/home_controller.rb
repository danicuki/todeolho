class HomeController < ApplicationController
  def index
  end

  def call
    @user = User.find(params[:user_id]) rescue nil
    @notification = Notification.find(params[:notification_id]) rescue nil
    respond_to do |format|
      format.xml
    end
  end

end
