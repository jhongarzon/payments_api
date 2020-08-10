require 'rails_helper'

RSpec.describe "product_stocks#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/product_stocks", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:product_stock)
    end
    let(:payload) do
      {
        data: {
          type: 'product_stocks',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ProductStockResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ProductStock.count }.by(1)
    end
  end
end
