class StockMovementsController < ApplicationController
  def index
    stock_movements = StockMovementResource.all(params)
    respond_with(stock_movements)
  end

  def show
    stock_movement = StockMovementResource.find(params)
    respond_with(stock_movement)
  end

  def create
    stock_movement = StockMovementResource.build(params)

    if stock_movement.save
      render jsonapi: stock_movement, status: 201
    else
      render jsonapi_errors: stock_movement
    end
  end

  def update
    stock_movement = StockMovementResource.find(params)

    if stock_movement.update_attributes
      render jsonapi: stock_movement
    else
      render jsonapi_errors: stock_movement
    end
  end

  def destroy
    stock_movement = StockMovementResource.find(params)

    if stock_movement.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: stock_movement
    end
  end
end
