class Machinetype < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :machinegroup_id, presence: true

  belongs_to :machinegroup
  validates_associated :machinegroup
end
