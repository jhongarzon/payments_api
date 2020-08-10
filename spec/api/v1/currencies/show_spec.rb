require 'rails_helper'

RSpec.describe "currencies#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/currencies/#{currency.id}", params: params
  end

  describe 'basic fetch' do
    let!(:currency) { create(:currency) }

    it 'works' do
      expect(CurrencyResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('currencies')
      expect(d.id).to eq(currency.id)
    end
  end
end
