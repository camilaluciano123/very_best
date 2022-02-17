require "rails_helper"

RSpec.describe UsersBestResource, type: :resource do
  describe "serialization" do
    let!(:users_best) { create(:users_best) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(users_best.id)
      expect(data.jsonapi_type).to eq("users_bests")
    end
  end

  describe "filtering" do
    let!(:users_best1) { create(:users_best) }
    let!(:users_best2) { create(:users_best) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: users_best2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([users_best2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:users_best1) { create(:users_best) }
      let!(:users_best2) { create(:users_best) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      users_best1.id,
                                      users_best2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      users_best2.id,
                                      users_best1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
