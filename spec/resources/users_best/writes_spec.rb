require 'rails_helper'

RSpec.describe UsersBestResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'users_bests',
          attributes: { }
        }
      }
    end

    let(:instance) do
      UsersBestResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { UsersBest.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:users_best) { create(:users_best) }

    let(:payload) do
      {
        data: {
          id: users_best.id.to_s,
          type: 'users_bests',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      UsersBestResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { users_best.reload.updated_at }
      # .and change { users_best.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:users_best) { create(:users_best) }

    let(:instance) do
      UsersBestResource.find(id: users_best.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { UsersBest.count }.by(-1)
    end
  end
end
