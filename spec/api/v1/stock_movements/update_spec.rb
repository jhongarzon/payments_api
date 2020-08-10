require 'rails_helper'

RSpec.describe "stock_movements#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/stock_movements/#{stock_movement.id}", payload
  end

  describe 'basic update' do
    let!(:stock_movement) { create(:stock_movement) }

    let(:payload) do
      {
        data: {
          id: stock_movement.id.to_s,
          type: 'stock_movements',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StockMovementResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { stock_movement.reload.attributes }
    end
  end
end
