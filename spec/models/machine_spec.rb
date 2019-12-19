require 'rails_helper'

RSpec.describe Machine, type: :model do
    describe 'validations' do
      it { should validate_presence_of :location }
      it { should belong_to :owner }
    end

    it "tests average price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      item_1 = dons.snacks.create(name: "Chex Mix", price: 2.00)
      item_2 = dons.snacks.create(name: "Skittles", price: 2.00)
      item_3 = dons.snacks.create(name: "Granola Bar", price: 1.00)

      expect(dons.average_price).to eq("$1.67")
    end
end
