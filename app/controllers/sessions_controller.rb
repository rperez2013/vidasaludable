class SessionsController < ApplicationController


  # GET /sessions/new
  # GET /sessions/new.json
  def new

  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end



  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
  
  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
