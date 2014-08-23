class PoliticiansController < ApplicationController
  def show
    @politician = Politician.find(params[:id])
    @notifications = @politician.notifications
  end

  def index
    @politicians = Politician.where("name LIKE ?", "%#{params[:q]}%").limit(params[:limit])
    render json: @politicians
  end
end
