class Repairstate < ActiveRecord::Base
  validates :description, uniqueness: true
end
