require "rails_helper"

RSpec.describe "users_bests#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/users_bests/#{users_best.id}", params: params
  end

  describe "basic fetch" do
    let!(:users_best) { create(:users_best) }

    it "works" do
      expect(UsersBestResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("users_bests")
      expect(d.id).to eq(users_best.id)
    end
  end
end
