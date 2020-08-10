require 'rails_helper'

RSpec.describe "product_stocks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/product_stocks/#{product_stock.id}", params: params
  end

  describe 'basic fetch' do
    let!(:product_stock) { create(:product_stock) }

    it 'works' do
      expect(ProductStockResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('product_stocks')
      expect(d.id).to eq(product_stock.id)
    end
  end
end
