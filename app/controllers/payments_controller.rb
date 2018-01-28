class PaymentsController < ApplicationController
  #before_action :get_wedding 
  #before_action :set_payment, only: [:show, :update, :destroy]
  
  def new
    #byebug
    @wedding = Wedding.find(params[:wedding_id])
    @plist=@wedding.payments.all
  	@payment=@wedding.payments.new
  end

  def edit
    @wedding = Wedding.find(params[:wedding_id])
    @payment = Payment.find(params[:id]) # @wedding.payments.find(params[:id])
    @checker = "Checking"
  end

  def create

     @wedding = Wedding.find(params[:wedding_id])
  	 @payment = @wedding.payments.new(payment_params)
    # @payment.pmt_date = DateTime.current
     
    respond_to do |format|
      if @payment.save
        format.html { redirect_to edit_wedding_path(@wedding), notice: 'payment was successfully created.' }
        format.json { render :new , status: :created , location: @payment}
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
        #format.json {render :edit }
      end
    end
  end
   def update

    # @wedding = Wedding.find(params[:wedding_id])
    respond_to do |format|
      @payment = Payment.find(params[:id])
      @wedding=Wedding.find(params[:wedding_id])
      if @payment.update(payment_params)
        format.html { redirect_to edit_wedding_path(@wedding), notice: 'payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end
  def get_wedding
    # find the wedding for this payment
    @wedding = Wedding.find(params[:wedding_id])
  end
  private
  
  def payment_params
      params.require(:payment).permit(:id, :pmt_date, :pmt_amount, :pmt_type, 
        :pmt_method, :reference, :wedding_id)
    end
end
