class Machine < ActiveRecord::Base
  belongs_to :machinetype
  belongs_to :brand
end
