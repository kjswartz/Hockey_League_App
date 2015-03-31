class SessionController < ApplicationController

  def signin
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = 'You signed in!'
    else
      flash[:warning] = 'Unable to log you in with those credentials.'
    end
    redirect_to '/'
  end

  def signout
    session[:user_id] = nil
    redirect_to '/', notice: "You are signed out!"
  end

end
