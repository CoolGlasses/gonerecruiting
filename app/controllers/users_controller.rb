class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new, :index]

  ##Need to change where the root route goes!!
  def index
      render :home
  end

  def create
    # sign up the user
    @user = User.new(user_params)
    if @user.save
      # redirect them to the new user's show page
      login!(@user)
      # msg = UserMailer.welcome_email(@user)
      # msg.deliver_now    ---  Welcome email code, haven't tested so commented this out
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    # present form for signup
    @user = User.new # dummy user object
    render :new
  end

  def show
    # show the user's details (just their username)
    if current_user.nil?
      # let them log in
      redirect_to new_session_url
      return
    end

    @players = get_recruits(current_user)
    @user = current_user
    render :show
  end

  protected
  def user_params
    self.params.require(:user).permit(:username, :password)
  end

  def get_recruits(current_user)
    recruits = Recruit.where("user_id = ?", current_user.id)

    players = recruits.map do |recruit|
      Player.where("id = ?", recruit.player_id)
    end

    players = players.flatten.uniq
    return players
  end
end