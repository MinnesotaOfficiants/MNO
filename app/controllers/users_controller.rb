class UsersController < ApplicationController
  def new
  end

  def update
  	respond_to do |format|
  	 	#byebug
	      @user = current_user
	      if @user.update(user_params)
	        format.html { redirect_to edit_user_path(current_user), notice: 'email_template was successfully updated.' }
	        format.json { render :show, status: :ok, location: @user}
	      else
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
  end

  

  def edit
  	#byebug
  	@user=current_user

  end
  private
  	def user_params
  		params.require(:user).permit!
  	end
end
