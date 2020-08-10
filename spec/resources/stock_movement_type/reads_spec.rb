require 'rails_helper'

RSpec.describe StockMovementTypeResource, type: :resource do
  describe 'serialization' do
    let!(:stock_movement_type) { create(:stock_movement_type) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(stock_movement_type.id)
      expect(data.jsonapi_type).to eq('stock_movement_types')
    end
  end

  describe 'filtering' do
    let!(:stock_movement_type1) { create(:stock_movement_type) }
    let!(:stock_movement_type2) { create(:stock_movement_type) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: stock_movement_type2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([stock_movement_type2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:stock_movement_type1) { create(:stock_movement_type) }
      let!(:stock_movement_type2) { create(:stock_movement_type) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            stock_movement_type1.id,
            stock_movement_type2.id
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
            stock_movement_type2.id,
            stock_movement_type1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
