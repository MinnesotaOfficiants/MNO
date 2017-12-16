class InquiriesController < ApplicationController
  before_action :require_user 
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
  #before_action :get_wedding 

  # GET /inquiries
  # GET /inquiries.json
  def index
     # @user = User.find(session[:user_id])
     @user = current_user
    # @inquiries = @user.inquiries
    if @user.admin?
      @inquiries = Inquiry.where(closed: :isopen ).order("id")
    else
      @tmp = @user.inquiries.where(closed:  :isopen)
      @inquiries = @tmp.order("email_sent_date desc").all
      
      
      # , closed: false
    end

    # @inquiries=Inquiry.where(user_id: 75) 

  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end

  # GET /inquiries/new
  def new
    @wedding = Wedding.find(params[:wedding_id])
    @inquiry = @wedding.inquiries.new
  end

  # GET /inquiries/1/edit
  def edit
    @inquiry = Inquiry.find(params[:id])
    @email_history = @inquiry.email_histories

    # redirect_to inquiry_edit_path
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    # byebug
    @wedding = Wedding.find(params[:wedding_id])
    @wedding.update_attribute(:status, :assigned)
    @inquiry = @wedding.inquiries.new(inquiry_params)

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to weddings_path, notice: 'Inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
        #byebug

    respond_to do |format|
      if @inquiry.update(inquiry_params)
        if params[:etemp][:id].present?
           history =  @inquiry.email_histories.new
           history.date_sent=Date.current
           history.email_template_id = params[:etemp][:id]
           history.save
         if @inquiry.contacted_email.blank?
            @inquiry.contacted_email = TRUE
            @inquiry.email_sent_date = Date.current
            @inquiry.save
          end
        end
        format.html { render :edit, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def close_wedding
      # when a wedding is closed we update status to closed (3) 
      # and close  all requests for wedding_id 
      #binding.pry
      # find the request 
      # can user do this action?
      #update status to closed
      # redirect user to request url

      puts "find request"
     @inquiry =  Inquiry.find(params[:id])
     #to do autorization
     puts "close status"
     @inquiry.close_status
     puts "redirect"
     # @wedding = Wedding.find(@request.wedding_id)
      # close each request

      # @wedding.requests.each do |r|
      #   r.closed = TRUE
      #   r.save
      #   end

     # closed = 3 booked = 4 update wedding to closed
      # @wedding.status = 3
      #  @wedding.save
       redirect_to inquiries_url

  end
  def book_wedding
   # when a wedding is booked we update status to booked (4)
      # and close  all requests for wedding_id 
      #binding.pry
      @inquiry =  Inquiry.find(params[:id])
      @wedding = Wedding.find(@inquiry.wedding_id)
      # close each request

      @wedding.inquiries.each do |r|
        r.closed = :isbooked
        r.save
      end

     # closed = 3 booked = 2 update wedding to booked
     @wedding.book(current_user)
     
      redirect_to weddings_url

  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:wedding_id, :notes, :contacted_email, :email_sent_date, 
      :second_email, :second_email_date, :contacted_phone, :phone_call_date, 
      :intro_meeting, :meeting_date, :user_id, :closed, wedding_attributes: 
      [:id, :bride_first_name, :bride_last_name, :bride_email, :bride_phone, :groom_first_name, 
        :groom_last_name, :groom_email, :groom_phone, :wedding_date, :wedding_time, :status, 
        :comments, :package_type, :rehearsal ,:image_file])
    end
end
