class SessionsController < ApplicationController
  def create
    # signs a user in
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user.nil?
      # no user with the given name!
      render json: 'Credentials were wrong'
    else
      # sign the user in
      login!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    # sign a user out
    logout!
    redirect_to new_session_url
  end

  def new
    # presents a login form
    render :new
  end
end