class EmailTemplatesController < ApplicationController
	def show
		render json: {
			body: "This is the template number #{params[:id]}"
		}
	end
end
