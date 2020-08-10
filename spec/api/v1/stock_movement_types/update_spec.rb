require 'rails_helper'

RSpec.describe "stock_movement_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/stock_movement_types/#{stock_movement_type.id}", payload
  end

  describe 'basic update' do
    let!(:stock_movement_type) { create(:stock_movement_type) }

    let(:payload) do
      {
        data: {
          id: stock_movement_type.id.to_s,
          type: 'stock_movement_types',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StockMovementTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { stock_movement_type.reload.attributes }
    end
  end
end
