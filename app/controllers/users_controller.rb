class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver_later
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        flash[:error] = "We were unable to sign you up. #{@user.errors.full_messages.join('. ')}"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_user
      @user = User.where(id: current_user).find_by(id: params[:id])
      redirect_to root_path, alert: "Permission not configured." if @user.nil?
    end

    def user_params
      params.require(:user).permit(:goals, :penalties, :games_played, :assists, :role, :phone, :bio, :password, :name, :email, :avatar, :avatar_cache, :remove_avatar)
    end
end
