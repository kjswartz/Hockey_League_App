class WelcomeController < ApplicationController
  def index
    @leagues = League.all
    @users = User.all
    @user_sample = @users.sample(3)
  end
end
