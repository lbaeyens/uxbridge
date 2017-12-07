class Repairstate < ApplicationRecord
  validates :description, uniqueness: true
end
