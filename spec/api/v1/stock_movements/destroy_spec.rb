require 'rails_helper'

RSpec.describe "stock_movements#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/stock_movements/#{stock_movement.id}"
  end

  describe 'basic destroy' do
    let!(:stock_movement) { create(:stock_movement) }

    it 'updates the resource' do
      expect(StockMovementResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { StockMovement.count }.by(-1)
      expect { stock_movement.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
