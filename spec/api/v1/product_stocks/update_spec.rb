require 'rails_helper'

RSpec.describe "product_stocks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/product_stocks/#{product_stock.id}", payload
  end

  describe 'basic update' do
    let!(:product_stock) { create(:product_stock) }

    let(:payload) do
      {
        data: {
          id: product_stock.id.to_s,
          type: 'product_stocks',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ProductStockResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { product_stock.reload.attributes }
    end
  end
end
