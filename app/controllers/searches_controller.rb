class SearchesController < ApplicationController
	def new
		@search=Search.new
		@user = current_user
	end

	def create
		# if not current_user.admin?
		# 	search_params[:user_id] = current_user.id
		# end
		@search=Search.create(search_params)
		
		redirect_to @search
	end
	def show
		@search=Search.find(params[:id])

	end
	private

	def search_params
		params.require(:search).permit(:bride_firstname, :bride_lastname, :groom_firstname, :groom_lastname ,
				:start_date, :end_date, :user_id, :location)
	end
end
