require 'rails_helper'

RSpec.describe "users_bests#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/users_bests", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'users_bests',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(UsersBestResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { UsersBest.count }.by(1)
    end
  end
end
