class PaymentStatusesController < ApplicationController
  def index
    payment_statuses = PaymentStatusResource.all(params)
    respond_with(payment_statuses)
  end

  def show
    payment_status = PaymentStatusResource.find(params)
    respond_with(payment_status)
  end

  def create
    payment_status = PaymentStatusResource.build(params)

    if payment_status.save
      render jsonapi: payment_status, status: 201
    else
      render jsonapi_errors: payment_status
    end
  end

  def update
    payment_status = PaymentStatusResource.find(params)

    if payment_status.update_attributes
      render jsonapi: payment_status
    else
      render jsonapi_errors: payment_status
    end
  end

  def destroy
    payment_status = PaymentStatusResource.find(params)

    if payment_status.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: payment_status
    end
  end
end
