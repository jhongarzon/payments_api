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
    
    
    decoded_auth_header = JsonWebToken.decode(request.headers["Authorization"])
    client_id = decoded_auth_header[:client_id]
    client = Client.find(client_id)

    intent = Stripe::PaymentIntent.create({
        amount: params[:amount],
        currency: params[:currency],
        payment_method_types: ['card'],
        receipt_email: client[:email],
        metadata: {integration_check: 'accept_a_payment'},
    })

    params[:client_id] = client_id
    params[:payment_method_type] = 'automatic'
    params[:payment_status_id] = 1
    params[:client_secret] = intent[:client_secret]


    payment_intent = PaymentIntent.create! client_secret: intent[:client_secret],
    amount: params[:amount],
    payment_method_type: 'automatic',    
    client_id: client_id,
    receipt_email: client[:email],
    currency_id: params[:currency_id],
    payment_status_id: 1

    # payment_intent = PaymentIntentResource.build(params)
    if payment_intent.id
      render json: { payment_intent_id: payment_intent.id, client_secret:  intent[:client_secret]}
    else
      render jsonapi_errors: payment_intent
    end
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
