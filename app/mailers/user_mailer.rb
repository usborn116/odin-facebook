class UserMailer < ApplicationMailer
    default from: 'usborn@pco.bz'

    def welcome_email
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to Mini FB!')
    end
  
end
