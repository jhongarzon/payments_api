class CurrenciesController < ApplicationController
  def index
    currencies = CurrencyResource.all(params)
    respond_with(currencies)
  end

  def show
    currency = CurrencyResource.find(params)
    respond_with(currency)
  end

  def create
    currency = CurrencyResource.build(params)

    if currency.save
      render jsonapi: currency, status: 201
    else
      render jsonapi_errors: currency
    end
  end

  def update
    currency = CurrencyResource.find(params)

    if currency.update_attributes
      render jsonapi: currency
    else
      render jsonapi_errors: currency
    end
  end

  def destroy
    currency = CurrencyResource.find(params)

    if currency.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: currency
    end
  end
end
