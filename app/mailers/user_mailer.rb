class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'https://rocky-sea-8876.herokuapp.com/'
    mail(to: @user.email, subject: "Welcome to the Hockey League App")
  end
end
