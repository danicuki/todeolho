class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    politician = Politician.find(params[:politician_id])

    respond_to do |format|
      if @user.save
        send_twilio(@user, politician.notifications.last)
        format.html { redirect_to root_path, notice: 'Agora você receberá as novidades desse candidato' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
      :url => "http://todeolho.herokuapp.com/call.xml?user_id=#{user.id}&#38;notification_id=#{notification.id}",  
      :method => 'GET',  
      :fallback_method => 'GET',  
      :status_callback_method => 'GET',    
      :record => 'false'
    })

      
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user].permit(:name, :email, :phone)
    end
end
