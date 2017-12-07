class Machinetype < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :machinegroup_id, presence: true

  belongs_to :machinegroup
  validates_associated :machinegroup
end
