class Machinegroup < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :machinetypes
end
