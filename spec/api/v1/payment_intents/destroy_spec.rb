require 'rails_helper'

RSpec.describe "payment_intents#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/payment_intents/#{payment_intent.id}"
  end

  describe 'basic destroy' do
    let!(:payment_intent) { create(:payment_intent) }

    it 'updates the resource' do
      expect(PaymentIntentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { PaymentIntent.count }.by(-1)
      expect { payment_intent.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
