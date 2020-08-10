require 'rails_helper'

RSpec.describe "currencies#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/currencies", params: params
  end

  describe 'basic fetch' do
    let!(:currency1) { create(:currency) }
    let!(:currency2) { create(:currency) }

    it 'works' do
      expect(CurrencyResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['currencies'])
      expect(d.map(&:id)).to match_array([currency1.id, currency2.id])
    end
  end
end
