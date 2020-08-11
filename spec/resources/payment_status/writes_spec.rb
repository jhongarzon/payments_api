require 'rails_helper'

RSpec.describe PaymentStatusResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'payment_statuses',
          attributes: attributes_for(:payment_status)
        }
      }
    end

    let(:instance) do
      PaymentStatusResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { PaymentStatus.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:payment_status) { create(:payment_status) }

    let(:payload) do
      {
        data: {
          id: payment_status.id.to_s,
          type: 'payment_statuses',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PaymentStatusResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { payment_status.reload.updated_at }
      # .and change { payment_status.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:payment_status) { create(:payment_status) }

    let(:instance) do
      PaymentStatusResource.find(id: payment_status.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { PaymentStatus.count }.by(-1)
    end
  end
end
