require 'rails_helper'

RSpec.describe "stock_movement_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/stock_movement_types", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:stock_movement_type)
    end
    let(:payload) do
      {
        data: {
          type: 'stock_movement_types',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(StockMovementTypeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StockMovementType.count }.by(1)
    end
  end
end
