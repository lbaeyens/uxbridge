class Postalcode < ApplicationRecord
  validates :postalcode, uniqueness: true
end
