class Machinegroup < ApplicationRecord
  validates :name, uniqueness: true

  has_many :machinetypes
end
