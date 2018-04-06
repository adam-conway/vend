require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons1  = owner.machines.create(location: "Don's")
    dons2  = owner.machines.create(location: "John's")
    dons3  = owner.machines.create(location: "Dawn's")
    snack1 = Snack.create!(name: "Hershey", price: 2.00)
    snack2 = Snack.create!(name: "snickers", price: 4.00)
    snack3 = Snack.create!(name: "twix", price: 6.00)
    MachineSnack.create!(machine_id: dons1.id, snack_id: snack1.id)
    MachineSnack.create!(machine_id: dons1.id, snack_id: snack2.id)
    MachineSnack.create!(machine_id: dons2.id, snack_id: snack3.id)
    MachineSnack.create!(machine_id: dons2.id, snack_id: snack1.id)
    MachineSnack.create!(machine_id: dons3.id, snack_id: snack2.id)
    MachineSnack.create!(machine_id: dons3.id, snack_id: snack3.id)

    visit snack_path(snack1)

    expect(page).to have_content("Name: Hershey")
    expect(page).to have_content("Price: $2.00")
    expect(page).to have_content("Don's")
    expect(page).to have_content("John's")
    expect(page).to have_content("Don's average price: $3.00")
    expect(page).to have_content("Don's snack count: 2")
    expect(page).to have_content("John's average price: $4.00")
    expect(page).to have_content("John's snack count: 2")
  end
end
