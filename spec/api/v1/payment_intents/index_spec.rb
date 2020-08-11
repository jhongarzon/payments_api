require 'rails_helper'

RSpec.describe "payment_intents#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/payment_intents", params: params
  end

  describe 'basic fetch' do
    let!(:payment_intent1) { create(:payment_intent) }
    let!(:payment_intent2) { create(:payment_intent) }

    it 'works' do
      expect(PaymentIntentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['payment_intents'])
      expect(d.map(&:id)).to match_array([payment_intent1.id, payment_intent2.id])
    end
  end
end
