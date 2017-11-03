class WeddingsController < ApplicationController
   before_action :require_user 

  def index
    @user = User.find(session[:user_id])
    # byebug
   
    if @user.admin?
       
      @weddings = Wedding.search(params[:search])
    else
      @weddings=Wedding.where('user_id = ? and  wedding_date > (?)', @user.id, Date.today-30).order(:wedding_date)
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
    @wedding = Wedding.new(wedding_params)

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
      @wedding=Wedding.find(params[:id])
      #binding.pry
      if @wedding.update(wedding_params)
        format.html { redirect_to weddings_path, notice: 'Wedding was successfully updated.' }
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
