require 'rails_helper'

RSpec.describe "payment_intents#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/payment_intents/#{payment_intent.id}", params: params
  end

  describe 'basic fetch' do
    let!(:payment_intent) { create(:payment_intent) }

    it 'works' do
      expect(PaymentIntentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('payment_intents')
      expect(d.id).to eq(payment_intent.id)
    end
  end
end
