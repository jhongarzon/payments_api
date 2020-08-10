require 'rails_helper'

RSpec.describe "currencies#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/currencies/#{currency.id}"
  end

  describe 'basic destroy' do
    let!(:currency) { create(:currency) }

    it 'updates the resource' do
      expect(CurrencyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Currency.count }.by(-1)
      expect { currency.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
