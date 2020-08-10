require 'rails_helper'

RSpec.describe "stock_movements#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/stock_movements", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:stock_movement)
    end
    let(:payload) do
      {
        data: {
          type: 'stock_movements',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(StockMovementResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StockMovement.count }.by(1)
    end
  end
end
