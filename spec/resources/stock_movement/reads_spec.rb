require 'rails_helper'

RSpec.describe StockMovementResource, type: :resource do
  describe 'serialization' do
    let!(:stock_movement) { create(:stock_movement) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(stock_movement.id)
      expect(data.jsonapi_type).to eq('stock_movements')
    end
  end

  describe 'filtering' do
    let!(:stock_movement1) { create(:stock_movement) }
    let!(:stock_movement2) { create(:stock_movement) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: stock_movement2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([stock_movement2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:stock_movement1) { create(:stock_movement) }
      let!(:stock_movement2) { create(:stock_movement) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            stock_movement1.id,
            stock_movement2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            stock_movement2.id,
            stock_movement1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
