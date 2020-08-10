require 'rails_helper'

RSpec.describe CurrencyResource, type: :resource do
  describe 'serialization' do
    let!(:currency) { create(:currency) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(currency.id)
      expect(data.jsonapi_type).to eq('currencies')
    end
  end

  describe 'filtering' do
    let!(:currency1) { create(:currency) }
    let!(:currency2) { create(:currency) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: currency2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([currency2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:currency1) { create(:currency) }
      let!(:currency2) { create(:currency) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            currency1.id,
            currency2.id
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
            currency2.id,
            currency1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
