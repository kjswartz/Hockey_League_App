class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'https://rocky-sea-8876.herokuapp.com/'
    mail(to: @user.email, subject: "Welcome to the Hockey League App")
  end

  def request_team_access_email(user, team)
    @user = user
    @team = team
    @url = "https://rocky-sea-8876.herokuapp.com/leagues/#{@team.league.id}/teams/#{@team.id}"
    mail(to: @team.owner, subject: "Welcome to the Hockey League App")
  end

end
