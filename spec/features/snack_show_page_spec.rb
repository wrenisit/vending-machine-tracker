require 'rails_helper'

RSpec.describe "snack show page" do
  it "has a show page" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Snacks")
    jims  = owner.machines.create(location: "Jim's Snacks")
    item_1 = Snack.create(name: "Chex Mix", price: 2.5)
    item_2 = Snack.create(name: "Skittles", price: 3)
    MachineSnacks.create(machine_id: dons.id, snack_id: item_1.id)
    MachineSnacks.create(machine_id: dons.id, snack_id: item_2.id)
    MachineSnacks.create(machine_id: jims.id, snack_id: item_1.id)

    visit "snacks/#{item_2.id}"
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)
    within "#location-#{dons.id}" do
      expect(page).to have_content(dons.location)
      expect(page).to have_content("Average Price: $1.50")
      expect(page).to have_content

    expect(page).to have_content(jims.location)

  end
end
