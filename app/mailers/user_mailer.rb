class UserMailer < ApplicationMailer
    default from: "notifications@gonerecruiting.com"

    def welcome_email(user)
        @user = user
        @url = "http://www.gonerecruiting.com/login"
        mail(to: user.email, subject: 'Welcome to My Awesome Site')
    end

    def forgot_password(user)
        @user = user
        @greeting = "Hi"
  
        mail to: user.email, :subject => 'Reset password instructions'
    end

    
end
