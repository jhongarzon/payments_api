require 'rails_helper'

RSpec.describe "payment_statuses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/payment_statuses/#{payment_status.id}", params: params
  end

  describe 'basic fetch' do
    let!(:payment_status) { create(:payment_status) }

    it 'works' do
      expect(PaymentStatusResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('payment_statuses')
      expect(d.id).to eq(payment_status.id)
    end
  end
end
