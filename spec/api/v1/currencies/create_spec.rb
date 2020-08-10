require 'rails_helper'

RSpec.describe "currencies#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/currencies", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:currency)
    end
    let(:payload) do
      {
        data: {
          type: 'currencies',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CurrencyResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Currency.count }.by(1)
    end
  end
end
