class PoliticiansController < ApplicationController
  def show
    @politician = Politician.find_by_uri(params[:id])
    @notifications = @politician.notifications
  end

  def index
    @politicians = Politician.where("nickname LIKE ?", "%#{params[:q]}%").limit(params[:limit])
    render json: @politicians
  end
end
