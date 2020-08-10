require 'rails_helper'

RSpec.describe "product_stocks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/product_stocks/#{product_stock.id}"
  end

  describe 'basic destroy' do
    let!(:product_stock) { create(:product_stock) }

    it 'updates the resource' do
      expect(ProductStockResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ProductStock.count }.by(-1)
      expect { product_stock.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
