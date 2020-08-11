require 'rails_helper'

RSpec.describe PaymentStatusResource, type: :resource do
  describe 'serialization' do
    let!(:payment_status) { create(:payment_status) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(payment_status.id)
      expect(data.jsonapi_type).to eq('payment_statuses')
    end
  end

  describe 'filtering' do
    let!(:payment_status1) { create(:payment_status) }
    let!(:payment_status2) { create(:payment_status) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: payment_status2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([payment_status2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:payment_status1) { create(:payment_status) }
      let!(:payment_status2) { create(:payment_status) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            payment_status1.id,
            payment_status2.id
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
            payment_status2.id,
            payment_status1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
