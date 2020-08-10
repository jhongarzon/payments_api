require 'rails_helper'

RSpec.describe ProductStockResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'product_stocks',
          attributes: attributes_for(:product_stock)
        }
      }
    end

    let(:instance) do
      ProductStockResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ProductStock.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:product_stock) { create(:product_stock) }

    let(:payload) do
      {
        data: {
          id: product_stock.id.to_s,
          type: 'product_stocks',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ProductStockResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { product_stock.reload.updated_at }
      # .and change { product_stock.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:product_stock) { create(:product_stock) }

    let(:instance) do
      ProductStockResource.find(id: product_stock.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ProductStock.count }.by(-1)
    end
  end
end
