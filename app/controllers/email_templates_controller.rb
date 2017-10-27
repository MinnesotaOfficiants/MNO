class EmailTemplatesController < ApplicationController
  def new
  end
  # def show
  # end
  def edit
  		@email_template = EmailTemplate.find(params[:id])
  end

  def update
  	 respond_to do |format|
  	 	# byebug
	      @email_template = EmailTemplate.find(params[:id])
	      if @email_template.update(email_template_params)
	        format.html { redirect_to edit_user_path(current_user), notice: 'email_template was successfully updated.' }
	        format.json { render :show, status: :ok, location: @email_template }
	      else
	        format.html { render :edit }
	        format.json { render json: @email_template.errors, status: :unprocessable_entity }
	      end
	    end
  end

  private	

  def email_template_params
  	params.require(:email_template).permit!

  end
end
