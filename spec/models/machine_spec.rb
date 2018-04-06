require 'rails_helper'

describe Machine do
  describe 'model methods' do
    it 'returns average price of snacks' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = Snack.create!(name: "Hershey", price: 1.50)
      snack2 = Snack.create!(name: "snickers", price: 2.50)
      MachineSnack.create!(machine_id: dons.id, snack_id: snack1.id)
      MachineSnack.create!(machine_id: dons.id, snack_id: snack2.id)

      expect(dons.average_snack_price).to eq(2.00)
    end
  end
  # describe 'relationships' do
  #   owner = Owner.create(name: "Sam's Snacks")
  #   dons  = owner.machines.create(location: "Don's Mixed Drinks")
  #
  #   visit machine_path(dons)
  #
  #   expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  # end
end