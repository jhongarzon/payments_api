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
    payment_intent = PaymentIntentResource.build(params)

    if payment_intent.save
      render jsonapi: payment_intent, status: 201
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
