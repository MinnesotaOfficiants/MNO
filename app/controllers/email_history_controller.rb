class EmailHistoryController < ApplicationController

	def create
		#byebug
		type = params[:type]
		template = params[:template_id]
		id = params[:id]
		if type == 'Request'
			@item=Inquiry.find(id).history.new
			@item.email_template_id = template_id
			@item.date_sent = Dtae.today

			
		else

		end
		respond_to do |format|
				format.html {redirect_to @item}
				format.js 
			end
	end

  def new
  end
  
  
end
