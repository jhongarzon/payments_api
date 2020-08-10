require 'rails_helper'

RSpec.describe StockMovementResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'stock_movements',
          attributes: attributes_for(:stock_movement)
        }
      }
    end

    let(:instance) do
      StockMovementResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StockMovement.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:stock_movement) { create(:stock_movement) }

    let(:payload) do
      {
        data: {
          id: stock_movement.id.to_s,
          type: 'stock_movements',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StockMovementResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { stock_movement.reload.updated_at }
      # .and change { stock_movement.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:stock_movement) { create(:stock_movement) }

    let(:instance) do
      StockMovementResource.find(id: stock_movement.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StockMovement.count }.by(-1)
    end
  end
end
