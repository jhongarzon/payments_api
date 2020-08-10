require 'rails_helper'

RSpec.describe "product_stocks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/product_stocks", params: params
  end

  describe 'basic fetch' do
    let!(:product_stock1) { create(:product_stock) }
    let!(:product_stock2) { create(:product_stock) }

    it 'works' do
      expect(ProductStockResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['product_stocks'])
      expect(d.map(&:id)).to match_array([product_stock1.id, product_stock2.id])
    end
  end
end
