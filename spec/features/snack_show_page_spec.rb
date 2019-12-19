require 'rails_helper'

RSpec.describe "snack show page" do
  it "has a show page" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Snacks")
    jims  = owner.machines.create(location: "Jim's Snacks")
    item_1 = Snack.create(name: "Chex Mix", price: 2)
    item_2 = Snack.create(name: "Skittles", price: 3)
    MachineSnack.create(machine_id: dons.id, snack_id: item_1.id)
    MachineSnack.create(machine_id: dons.id, snack_id: item_2.id)
    MachineSnack.create(machine_id: jims.id, snack_id: item_1.id)

    visit "snacks/#{item_1.id}"
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)

    within "#location-#{dons.id}" do
      expect(page).to have_content(dons.location)
      expect(page).to have_content("Average Price: $2.50")
      expect(page).to have_content("Items in Machine: 2")
    end

    within "#location-#{jims.id}" do
      expect(page).to have_content(jims.location)
      expect(page).to have_content("Average Price: $2.00")
      expect(page).to have_content("Items in Machine: 1")
    end
  end
end
