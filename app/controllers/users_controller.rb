class UsersController < ApplicationController
  def new
  end

  def update
  end

  def edit
  	#byebug
  	@user=current_user

  end
end
