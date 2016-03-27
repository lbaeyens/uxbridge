class Postalcode < ActiveRecord::Base
  validates :postalcode, uniqueness: true
end
