class UserMailer < ApplicationMailer
    default from: "notifications@gonerecruiting.com"

    def welcome_email
        @user = params[:user]
        @url = 'http://www.gonerecruiting.com/session/new'
        mail(to: @user.email, subject: 'Welcome to GoneRecruiting')
    end

    def forgot_password(user)
        @user = user
        @greeting = "Hi"
  
        mail to: user.email, :subject => 'Reset password instructions'
    end
end
