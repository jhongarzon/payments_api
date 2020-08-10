require 'rails_helper'

RSpec.describe "stock_movements#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stock_movements/#{stock_movement.id}", params: params
  end

  describe 'basic fetch' do
    let!(:stock_movement) { create(:stock_movement) }

    it 'works' do
      expect(StockMovementResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('stock_movements')
      expect(d.id).to eq(stock_movement.id)
    end
  end
end
