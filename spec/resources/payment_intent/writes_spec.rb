require 'rails_helper'

RSpec.describe PaymentIntentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'payment_intents',
          attributes: attributes_for(:payment_intent)
        }
      }
    end

    let(:instance) do
      PaymentIntentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { PaymentIntent.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:payment_intent) { create(:payment_intent) }

    let(:payload) do
      {
        data: {
          id: payment_intent.id.to_s,
          type: 'payment_intents',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PaymentIntentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { payment_intent.reload.updated_at }
      # .and change { payment_intent.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:payment_intent) { create(:payment_intent) }

    let(:instance) do
      PaymentIntentResource.find(id: payment_intent.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { PaymentIntent.count }.by(-1)
    end
  end
end
