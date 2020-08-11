require 'rails_helper'

RSpec.describe "payment_intents#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/payment_intents/#{payment_intent.id}", payload
  end

  describe 'basic update' do
    let!(:payment_intent) { create(:payment_intent) }

    let(:payload) do
      {
        data: {
          id: payment_intent.id.to_s,
          type: 'payment_intents',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PaymentIntentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { payment_intent.reload.attributes }
    end
  end
end
