class ProductStocksController < ApplicationController
  def index
    product_stocks = ProductStockResource.all(params)
    respond_with(product_stocks)
  end

  def show
    product_stock = ProductStockResource.find(params)
    respond_with(product_stock)
  end

  def create
    product_stock = ProductStockResource.build(params)

    if product_stock.save
      render jsonapi: product_stock, status: 201
    else
      render jsonapi_errors: product_stock
    end
  end

  def update
    product_stock = ProductStockResource.find(params)

    if product_stock.update_attributes
      render jsonapi: product_stock
    else
      render jsonapi_errors: product_stock
    end
  end

  def destroy
    product_stock = ProductStockResource.find(params)

    if product_stock.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: product_stock
    end
  end
end
