class EmailHistoryController < ApplicationController

	def create
		byebug
		if params[:type] ='Request'
			@item=Inquiry.find(params[:inquiry_id])

			r
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
