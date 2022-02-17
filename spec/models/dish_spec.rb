require 'rails_helper'

RSpec.describe Dish, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:users_bests) }

    it { should belong_to(:cuisine) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
