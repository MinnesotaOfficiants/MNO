class EmailTemplatesController < ApplicationController
 def show
    #byebug
    @template=EmailTemplate.find(params[:id])
    @body=@template.template_content
    render json: { 
      body: " " + @body
      }
       
    
  end

  def not_show
     render json: {
      body: "This is the template number #{params[:id]}" 
     }
  end
  def new
    @email_template = current_user.email_templates.new

  end
  
  def create
    @email_template = current_user.email_templates.new(email_template_params)
    respond_to do |format|
      if @email_template.save
        format.html { redirect_to edit_user_path(current_user), notice: 'Template was successfully created.' }
        flash.now.alert = "New tempalte created"
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end


  end
  def preview
    
    @email_template = EmailTemplate.find(params[:id])
  end
  def edit
  		@email_template = EmailTemplate.find(params[:id])
  end


  def update
  	 respond_to do |format|
  	 	# byebug
	      @email_template = EmailTemplate.find(params[:id])
	      if @email_template.update(email_template_params)
          # format.html { redirect_to edit_user_path(current_user), notice: 'email_template was successfully updated.' }
	        format.html { render edit_email_template_path, notice: 'email_template was successfully updated.' }
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
