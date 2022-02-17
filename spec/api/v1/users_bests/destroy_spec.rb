require "rails_helper"

RSpec.describe "users_bests#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/users_bests/#{users_best.id}"
  end

  describe "basic destroy" do
    let!(:users_best) { create(:users_best) }

    it "updates the resource" do
      expect(UsersBestResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UsersBest.count }.by(-1)
      expect { users_best.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
