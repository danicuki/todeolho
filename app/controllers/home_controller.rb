class HomeController < ApplicationController
  def index
  end

  def call
    @user = User.find(params[:user_id])
    @notification = Notification.find(params[:notification_id])
    respond_to do |format|
      format.xml
    end
  end
end
