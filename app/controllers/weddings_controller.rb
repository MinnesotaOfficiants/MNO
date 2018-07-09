class WeddingsController < ApplicationController
   before_action :require_user 

  def index
    @user = User.find(session[:user_id])
   
    if @user.admin?
       
      @weddings = Wedding.search(params[:search])
    else
      #@weddings = Wedding.search(params[:search])
      # @weddings=Wedding.where('user_id = ? and  wedding_date > (?)', @user.id, Date.today-30).order(:wedding_date)
      @weddings=Wedding.where('user_id = ? and  wedding_date > (?)', @user.id, Date.today-30).order(:wedding_date)

    end
  end
  def set_fee_payment
    # byebug
    @wedding = Wedding.find(params[:id])
    @wedding.make_fee_payment
    redirect_to fee_report_path
  end
  def fee_report
    # byebug
    @user_fees=Wedding.where("user_id = ?  and (fee_paid_date is null or fee_paid_date >  (?)) ", current_user.id, Date.today - 250).order("fee_paid_date is null desc, fee_paid_date desc")
  end
  
  def send_fee_email
    @feeReport=Wedding.where("user_id = ? and fee_paid_date = (?)", current_user.id, Date.today)
    if @feeReport.count < 1
      redirect_to fee_report_path, notice: "There are no fees ready."
    end
  end
  # GET /weddings/1
  # GET /weddings/1.json
  def show
    @wedding=Wedding.find(params[:id])
    @email_history=@wedding.email_histories
    @payments=@wedding.payments
  end
  def add_payment
    # make a call to add an empty wedding payment
    #then refresc edit
    #byebug
   @wedding=Wedding.find(params[:id])
   
    #@wedding.update(wedding_params)
    @wedding.payments.create
    respond_to do |format|
      format.html {  redirect_to edit_wedding_path }
      format.js
    end


  end
  def get_new_web_requests
    # byebug
    @result = Wedding.last
    @result.get_new_weddings
    redirect_to weddings_path
  end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
  end

  # GET /weddings/1/edit
  def edit
    @user = current_user
    @wedding=Wedding.find(params[:id])
  end

  # POST /weddings
  # POST /weddings.json
  def create
    byebug
    @wedding = Wedding.new(wedding_params)
    @user=current_user
    if not @user.admin? and @wedding.status == "open"
      @wedding.status = :booked
    end
    respond_to do |format|
      if @wedding.save
        format.html { redirect_to weddings_path, notice: 'Wedding was successfully created.' }
        format.json { render :show, status: :created, location: @wedding }
      else
        format.html { render :new }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weddings/1
  # PATCH/PUT /weddings/1.json
  def update
   
    respond_to do |format|
      @user =current_user
      @wedding=Wedding.find(params[:id])
       #byebug
      if @wedding.wedding_cost.blank?
        @wedding.wedding_cost=0
      end
      if @wedding.other_cost.blank?
        @wedding.other_cost=0
      end
      if @wedding.referal_fee.blank?
        @wedding.referal_fee = 0
      end
      if @wedding.update(wedding_params) 
        if not @user.admin?
          @wedding.calculate_cost(current_user)

          if params[:etemp][:id].present?
           history =  @wedding.email_histories.new
           history.date_sent=Date.current
           history.email_template_id = params[:etemp][:id]
           history.save
          end
        end
        format.html { render :edit, notice: 'Wedding was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding }
      else
        format.html { render :edit }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weddings/1
  # DELETE /weddings/1.json
  def destroy
    @wedding.destroy
    respond_to do |format|
      format.html { redirect_to weddings_url, notice: 'Wedding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
      @wedding = Wedding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_params
      params.require(:wedding).permit!

    end
end
