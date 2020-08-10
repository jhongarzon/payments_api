require 'rails_helper'

RSpec.describe CurrencyResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'currencies',
          attributes: attributes_for(:currency)
        }
      }
    end

    let(:instance) do
      CurrencyResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Currency.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:currency) { create(:currency) }

    let(:payload) do
      {
        data: {
          id: currency.id.to_s,
          type: 'currencies',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CurrencyResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { currency.reload.updated_at }
      # .and change { currency.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:currency) { create(:currency) }

    let(:instance) do
      CurrencyResource.find(id: currency.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Currency.count }.by(-1)
    end
  end
end
