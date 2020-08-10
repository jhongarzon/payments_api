require 'rails_helper'

RSpec.describe StockMovementTypeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'stock_movement_types',
          attributes: attributes_for(:stock_movement_type)
        }
      }
    end

    let(:instance) do
      StockMovementTypeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StockMovementType.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:stock_movement_type) { create(:stock_movement_type) }

    let(:payload) do
      {
        data: {
          id: stock_movement_type.id.to_s,
          type: 'stock_movement_types',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StockMovementTypeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { stock_movement_type.reload.updated_at }
      # .and change { stock_movement_type.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:stock_movement_type) { create(:stock_movement_type) }

    let(:instance) do
      StockMovementTypeResource.find(id: stock_movement_type.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StockMovementType.count }.by(-1)
    end
  end
end
