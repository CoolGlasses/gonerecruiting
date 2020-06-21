class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new, :index]
  skip_before_action :verify_authenticity_token

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
      msg = UserMailer.welcome_email(@user)
      msg.deliver_now    #---  Welcome email code, haven't tested so commented this out
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

  def filter
        player_name = params["filter"]["name"].downcase
        height = params["filter"]["height"]
        position = params["filter"]["position"]
        school = params["filter"]["school"].downcase
        grade = params["filter"]["grade"]
        @recruits = get_recruits(current_user)

        if @recruits.nil?
           return render :show
        end

        if !height.nil?
            converted_height = convert_height(height)
            if @players.nil?
                @players = Player.where("height_inches >= #{converted_height}")
            else
                @players = @players.where("height_inches >= #{converted_height}")
            end
        end

        if grade != "" && !grade.nil?
            if @players.nil?
                @players = Player.where("grade = ?", grade)
            else
                @players = @players.where("grade = ?", grade)
            end
        end

        if !position.nil?
            if @players.nil?
                @players = Player.where("position = ?", position)
            else
                @players = @players.where("position = ?", position)
            end
        end

        if school != ""
            if @players.nil?
                @players = Player.where("LOWER(school_name) LIKE ?", "%#{school}%")
            else
                @players = @players.where("LOWER(school_name) LIKE ?", "%#{school}%")
            end
        end

        if player_name != "" && !player_name.nil?
            if @players.nil?
                @players = Player.where("LOWER(name) LIKE ?", "%#{player_name}%")
            else
                @players = @players.where("LOWER(name) LIKE ?", "%#{player_name}%")
            end
        end

        initial_where_clause = @players

        @recruits.each do |recruit|
            @players = @players.or(initial_where_clause)
        end

        @user = current_user
        @players.to_a
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