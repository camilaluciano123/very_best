require "rails_helper"

RSpec.describe "users_bests#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/users_bests/#{users_best.id}", payload
  end

  describe "basic update" do
    let!(:users_best) { create(:users_best) }

    let(:payload) do
      {
        data: {
          id: users_best.id.to_s,
          type: "users_bests",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UsersBestResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { users_best.reload.attributes }
    end
  end
end
