require 'rails_helper'

describe Machinetype do

  it { should belong_to(:machinegroup) }

end