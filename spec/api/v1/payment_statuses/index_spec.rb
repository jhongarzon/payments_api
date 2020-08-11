require 'rails_helper'

RSpec.describe "payment_statuses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/payment_statuses", params: params
  end

  describe 'basic fetch' do
    let!(:payment_status1) { create(:payment_status) }
    let!(:payment_status2) { create(:payment_status) }

    it 'works' do
      expect(PaymentStatusResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['payment_statuses'])
      expect(d.map(&:id)).to match_array([payment_status1.id, payment_status2.id])
    end
  end
end
