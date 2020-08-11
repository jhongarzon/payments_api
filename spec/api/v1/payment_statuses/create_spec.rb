require 'rails_helper'

RSpec.describe "payment_statuses#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/payment_statuses", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:payment_status)
    end
    let(:payload) do
      {
        data: {
          type: 'payment_statuses',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(PaymentStatusResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { PaymentStatus.count }.by(1)
    end
  end
end
