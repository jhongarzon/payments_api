require 'rails_helper'

RSpec.describe "stock_movements#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stock_movements", params: params
  end

  describe 'basic fetch' do
    let!(:stock_movement1) { create(:stock_movement) }
    let!(:stock_movement2) { create(:stock_movement) }

    it 'works' do
      expect(StockMovementResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['stock_movements'])
      expect(d.map(&:id)).to match_array([stock_movement1.id, stock_movement2.id])
    end
  end
end
