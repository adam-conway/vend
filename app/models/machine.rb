class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snack
  has_many :snacks, through: :machine_snack

  def average_snack_price
    self.snacks.average(:price)
  end
end
