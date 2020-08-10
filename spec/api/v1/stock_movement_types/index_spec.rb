require 'rails_helper'

RSpec.describe "stock_movement_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stock_movement_types", params: params
  end

  describe 'basic fetch' do
    let!(:stock_movement_type1) { create(:stock_movement_type) }
    let!(:stock_movement_type2) { create(:stock_movement_type) }

    it 'works' do
      expect(StockMovementTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['stock_movement_types'])
      expect(d.map(&:id)).to match_array([stock_movement_type1.id, stock_movement_type2.id])
    end
  end
end
