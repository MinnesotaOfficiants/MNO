class Search < ApplicationRecord
	def search_weddings
		weddings=Wedding.all
	# byebug
		weddings = weddings.where(["bride_first_name LIKE ?", "%#{bride_firstname}%"]) if bride_firstname.present?
		weddings = weddings.where(["bride_last_name LIKE ?", "%#{bride_lastname}%"]) if bride_lastname.present?
		weddings = weddings.where(["groom_first_name LIKE ?", "%#{groom_firstname}%"]) if groom_firstname.present?
		weddings = weddings.where(["groom_last_name LIKE ?", "%#{groom_lastname}%"]) if groom_lastname.present?
		weddings = weddings.where(["location LIKE ?", "%#{location}%"]) if location.present?
		weddings = weddings.where(["wedding_date between ? and ?", start_date , end_date]) if start_date.present? and end_date.present?
		weddings = weddings.where(["user_id = ?",user_id] ) if user_id.present?
		return weddings
	end
end	