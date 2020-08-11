require 'rails_helper'

RSpec.describe PaymentIntentResource, type: :resource do
  describe 'serialization' do
    let!(:payment_intent) { create(:payment_intent) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(payment_intent.id)
      expect(data.jsonapi_type).to eq('payment_intents')
    end
  end

  describe 'filtering' do
    let!(:payment_intent1) { create(:payment_intent) }
    let!(:payment_intent2) { create(:payment_intent) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: payment_intent2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([payment_intent2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:payment_intent1) { create(:payment_intent) }
      let!(:payment_intent2) { create(:payment_intent) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            payment_intent1.id,
            payment_intent2.id
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
            payment_intent2.id,
            payment_intent1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
