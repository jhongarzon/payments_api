require 'rails_helper'

RSpec.describe PaymentResource, type: :resource do
  describe 'serialization' do
    let!(:payment) { create(:payment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(payment.id)
      expect(data.jsonapi_type).to eq('payments')
    end
  end

  describe 'filtering' do
    let!(:payment1) { create(:payment) }
    let!(:payment2) { create(:payment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: payment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([payment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:payment1) { create(:payment) }
      let!(:payment2) { create(:payment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            payment1.id,
            payment2.id
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
            payment2.id,
            payment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
