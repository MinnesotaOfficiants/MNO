class EmailHistoryController < ApplicationController

	def create
		if params[:type] ='Request'
			@item=Inquiry.find(params[:inquiry_id])

			
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
