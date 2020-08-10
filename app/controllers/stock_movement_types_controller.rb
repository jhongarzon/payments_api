class StockMovementTypesController < ApplicationController
  def index
    stock_movement_types = StockMovementTypeResource.all(params)
    respond_with(stock_movement_types)
  end

  def show
    stock_movement_type = StockMovementTypeResource.find(params)
    respond_with(stock_movement_type)
  end

  def create
    stock_movement_type = StockMovementTypeResource.build(params)

    if stock_movement_type.save
      render jsonapi: stock_movement_type, status: 201
    else
      render jsonapi_errors: stock_movement_type
    end
  end

  def update
    stock_movement_type = StockMovementTypeResource.find(params)

    if stock_movement_type.update_attributes
      render jsonapi: stock_movement_type
    else
      render jsonapi_errors: stock_movement_type
    end
  end

  def destroy
    stock_movement_type = StockMovementTypeResource.find(params)

    if stock_movement_type.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: stock_movement_type
    end
  end
end
