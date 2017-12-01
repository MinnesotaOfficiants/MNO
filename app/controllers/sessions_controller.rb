class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:user_name].downcase, params[:password])
    if user
      session[:user_id] = user.id
      if user.admin?
        # now get any new inquiries from mn site
        
         redirect_to weddings_path
      else
        redirect_to inquiries_path
      end
    else
      flash.now.alert = "Invalid user name or password"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
