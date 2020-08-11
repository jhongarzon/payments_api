require 'rails_helper'

RSpec.describe "payment_statuses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/payment_statuses/#{payment_status.id}", payload
  end

  describe 'basic update' do
    let!(:payment_status) { create(:payment_status) }

    let(:payload) do
      {
        data: {
          id: payment_status.id.to_s,
          type: 'payment_statuses',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PaymentStatusResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { payment_status.reload.attributes }
    end
  end
end
