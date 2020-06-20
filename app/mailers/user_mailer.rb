class UserMailer < ApplicationMailer
    default from: "notifications@gonerecruiting.com"

    def welcome_email
        mail(to: params[:user].email) do |format|
        format.html { render layout: 'mailer' }
        format.text
        end
    end

    def forgot_password(user)
        @user = user
        @greeting = "Hi"
  
        mail to: user.email, :subject => 'Reset password instructions'
    end
end
