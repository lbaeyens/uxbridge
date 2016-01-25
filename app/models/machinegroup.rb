class Machinegroup < ActiveRecord::Base
  validates :name, uniqueness: true
end
