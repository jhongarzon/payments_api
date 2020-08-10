require 'rails_helper'

RSpec.describe "currencies#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/currencies/#{currency.id}", payload
  end

  describe 'basic update' do
    let!(:currency) { create(:currency) }

    let(:payload) do
      {
        data: {
          id: currency.id.to_s,
          type: 'currencies',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CurrencyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { currency.reload.attributes }
    end
  end
end
