class Machine < ApplicationRecord
  belongs_to :machinetype
  belongs_to :brand
  #TODO add validations to the machine model
end
