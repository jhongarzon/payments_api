class PaymentIntentsController < ApplicationController
  def index
    payment_intents = PaymentIntentResource.all(params)
    respond_with(payment_intents)
  end

  def show
    payment_intent = PaymentIntentResource.find(params)
    respond_with(payment_intent)
  end

  def create
    # payment_intent = PaymentIntentResource.build(params)

  intent = Stripe::PaymentIntent.create({
      amount: params[:amount],
      currency: params[:currency],
      metadata: {integration_check: 'accept_a_payment'},})
      
    # PaymentIntent.create! client_secret: Faker::Crypto.sha256,
    # amount: Faker::Commerce.price,
    # payment_method_type: 'automatic',    
    # client_id: rand(1..10),
    # currency_id: rand(1..10),
    # payment_status_id:rand(1..3)
    decoded_auth_header = JsonWebToken.decode(request.headers["Authorization"])
    Client.find(decoded_auth_header[:client_id])
    render json: { client_secret:  intent[:client_secret]}
    
    # if payment_intent.save
    #   render jsonapi: payment_intent, status: 201
    # else
    #   render jsonapi_errors: payment_intent
    # end
  end

  def update
    payment_intent = PaymentIntentResource.find(params)

    if payment_intent.update_attributes
      render jsonapi: payment_intent
    else
      render jsonapi_errors: payment_intent
    end
  end

  def destroy
    payment_intent = PaymentIntentResource.find(params)

    if payment_intent.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: payment_intent
    end
  end
end
