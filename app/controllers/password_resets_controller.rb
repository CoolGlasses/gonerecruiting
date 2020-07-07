class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user
      @user.send_password_reset
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
    render :edit
  end

  def show
    render plain: "this is wrong"
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hour.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to 'sessions#new'
    elsif user_params["password"] != user_params["password_confirmation"]
      flash[:notice] = "Passwords do not match.  Please try again!"
      render :edit
    elsif @user.update(password: user_params["password"])
      flash[:notice] = 'Password has been reset!'
      redirect_to root_url
    else
      flash[:alert] = "Something went wrong.  Please try again."
      render :edit
    end
  end


  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless @user
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
    #   if @user.password_reset_expired?
    #     flash[:danger] = "Password reset has expired."
    #     redirect_to new_password_reset_url
    #   end
    end
end