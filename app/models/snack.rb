class Snack < ApplicationRecord
  has_many :machine_snack
  has_many :machines, through: :machine_snack
end
