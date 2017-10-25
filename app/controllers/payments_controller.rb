class PaymentsController < ApplicationController
  before_action :get_wedding
  def new
    #byebug
  	@payment=@wedding.payments.new
  end

  def edit
    @payment = @wedding.payments.find(params[:id])
  end

  def create
    # byebug
  	 @payment = @wedding.payments.new(payment_params)
     @payment.pmt_date = DateTime.current
     
    respond_to do |format|
      if @payment.save
        format.html { redirect_to edit_wedding_path(@wedding), notice: 'payment was successfully created.' }
        format.js
      else
        format.html { render :new }
        # format.json { render json: @payment.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end
   def update
    respond_to do |format|
      @payment = @wedding.payments.find(params[:id])
      if @payment.update(payment_params)
        format.html { redirect_to [@wedding,@payment], notice: 'payment was successfully updated.' }
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
      params.require(:payment).permit!
      #(:pmt_date, :pmt_amount, :pmt_type, :pmt_method, :reference, :wedding_id)
    end
end
