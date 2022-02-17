require 'rails_helper'

RSpec.describe "users_bests#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/users_bests", params: params
  end

  describe 'basic fetch' do
    let!(:users_best1) { create(:users_best) }
    let!(:users_best2) { create(:users_best) }

    it 'works' do
      expect(UsersBestResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['users_bests'])
      expect(d.map(&:id)).to match_array([users_best1.id, users_best2.id])
    end
  end
end
