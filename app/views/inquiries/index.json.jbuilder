json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :id, :wedding_id, :notes, :contacted_email, :email_sent_date, :second_email, :second_email_date, :contacted_phone, :contacted_phone-date, :intro_meeting, :meeting_date, :user_id, :wedding_id, :closed
  json.url inquiry_url(inquiry, format: :json)
end
