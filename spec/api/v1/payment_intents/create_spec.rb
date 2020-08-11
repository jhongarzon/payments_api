require 'rails_helper'

RSpec.describe "payment_intents#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/payment_intents", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:payment_intent)
    end
    let(:payload) do
      {
        data: {
          type: 'payment_intents',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(PaymentIntentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { PaymentIntent.count }.by(1)
    end
  end
end
