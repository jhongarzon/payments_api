require 'rails_helper'

RSpec.describe "stock_movement_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/stock_movement_types/#{stock_movement_type.id}"
  end

  describe 'basic destroy' do
    let!(:stock_movement_type) { create(:stock_movement_type) }

    it 'updates the resource' do
      expect(StockMovementTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { StockMovementType.count }.by(-1)
      expect { stock_movement_type.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
