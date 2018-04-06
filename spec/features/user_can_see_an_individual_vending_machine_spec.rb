require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see the names and prices of all snacks associated with machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create!(name: "Hershey", price: 1.50)
    snack2 = Snack.create!(name: "snickers", price: 2.50)
    snack3 = Snack.create!(name: "twix", price: 4.50)
    MachineSnack.create!(machine_id: dons.id, snack_id: snack1.id)
    MachineSnack.create!(machine_id: dons.id, snack_id: snack2.id)
    MachineSnack.create!(machine_id: dons.id, snack_id: snack3.id)

    visit machine_path(dons)

    expect(page).to have_content("Hershey: $1.50")
    expect(page).to have_content("snickers: $2.50")
    expect(page).to have_content("twix: $4.50")
  end
  scenario 'they see the average price for all snacks associated with machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create!(name: "Hershey", price: 2.50)
    snack2 = Snack.create!(name: "snickers", price: 3.50)
    MachineSnack.create!(machine_id: dons.id, snack_id: snack1.id)
    MachineSnack.create!(machine_id: dons.id, snack_id: snack2.id)

    visit machine_path(dons)

    expect(page).to have_content("Average price: $3.00")
  end
end
