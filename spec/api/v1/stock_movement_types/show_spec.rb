require 'rails_helper'

RSpec.describe "stock_movement_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stock_movement_types/#{stock_movement_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:stock_movement_type) { create(:stock_movement_type) }

    it 'works' do
      expect(StockMovementTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('stock_movement_types')
      expect(d.id).to eq(stock_movement_type.id)
    end
  end
end
