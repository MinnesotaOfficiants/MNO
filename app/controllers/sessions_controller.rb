class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to inquiries_path
    else
      flash.now.alert = "Invalid user name or password"
      render "new"
    end
  end
  
  
end
