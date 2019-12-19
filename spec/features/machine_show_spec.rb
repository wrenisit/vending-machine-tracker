require 'rails_helper'

RSpec.describe "machine show page" do
  it "has a show page for machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    item_1 = dons.snacks.create(name: "Chex Mix", price: 2.5)
    item_2 = dons.snacks.create(name: "Skittles", price: 3)
    item_3 = dons.snacks.create(name: "Granola Bar", price: 1)

    visit "machines/#{dons.id}"
    expect(current_path).to eq("/machines/#{dons.id}")
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content(item_3.name)
    expect(page).to have_content(item_3.price)
    expect(page).to have_content("Average Price: $2.00")
  end
end
