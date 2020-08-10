require 'rails_helper'

RSpec.describe ProductStockResource, type: :resource do
  describe 'serialization' do
    let!(:product_stock) { create(:product_stock) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(product_stock.id)
      expect(data.jsonapi_type).to eq('product_stocks')
    end
  end

  describe 'filtering' do
    let!(:product_stock1) { create(:product_stock) }
    let!(:product_stock2) { create(:product_stock) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: product_stock2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([product_stock2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:product_stock1) { create(:product_stock) }
      let!(:product_stock2) { create(:product_stock) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            product_stock1.id,
            product_stock2.id
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
            product_stock2.id,
            product_stock1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
