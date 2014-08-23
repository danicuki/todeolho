class PoliticiansController < ApplicationController
  def show
    @politician = Politician.find(params[:id])
  end

  def index
    @politicians = Politician.all
    render json: @politicians
  end
end
