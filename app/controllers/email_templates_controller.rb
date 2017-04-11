class EmailTemplatesController < ApplicationController
	def show
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
end
