require 'rails_helper'

RSpec.describe "payment_statuses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/payment_statuses/#{payment_status.id}"
  end

  describe 'basic destroy' do
    let!(:payment_status) { create(:payment_status) }

    it 'updates the resource' do
      expect(PaymentStatusResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { PaymentStatus.count }.by(-1)
      expect { payment_status.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
