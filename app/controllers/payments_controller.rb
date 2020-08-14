class PaymentsController < ApplicationController
  

  def index
    payments = PaymentResource.all(params)
    respond_with(payments)
  end

  def show
    payment = PaymentResource.find(params)
    respond_with(payment)
  end

  def getStripeKey
    render json: {public_key: Rails.application.credentials.stripe_public_key} 
    # stripe_secret_key
  end

  def create
    paymentIntent = PaymentIntent.find(params[:payment_intent_id])    

    cancelled_at = nil
    cancellation_reason = ''
    payment_status_id = 2

    if params[:status] != 'succeeded'
      cancelled_at = DateTime.now()
      cancellation_reason = status
      payment_status_id = 3
    end
    
   

    payment = Payment.create! payment_intent_id: params[:payment_intent_id],
    client_secret: paymentIntent[:client_secret],
    amount: paymentIntent[:amount],
    client_id: paymentIntent[:client_id],
    receipt_email: paymentIntent[:receipt_email],
    currency_id: paymentIntent[:currency_id],
    payment_status_id: payment_status_id,
    cancelled_at: cancelled_at,
    cancellation_reason: cancellation_reason

    
    if payment.id 
      
      StockMovement.create!  client_id: paymentIntent[:client_id], 
      product_id: params[:product_id],
      stock_movement_type_id: 2
       
      render json: { success: true}
    else
      render json: { success: false}
    end
  end

  def update
    payment = PaymentResource.find(params)

    if payment.update_attributes
      render jsonapi: payment
    else
      render jsonapi_errors: payment
    end
  end

  def destroy
    payment = PaymentResource.find(params)

    if payment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: payment
    end
  end
end
