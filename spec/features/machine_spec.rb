require 'rails_helper'

RSpec.feature 'machines page' do

  scenario 'is accessible through the Catalogue link' do
    visit '/'
    expect(page).to have_link('Catalogue')
  end
end

RSpec.feature 'new machines' do

  scenario 'can be created when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/machines'
    expect(page).to have_link('Add Machine')
  end

  scenario 'cannot be created when no user is logged in' do
    visit '/machines'
    expect(page).not_to have_link('Add Machine')
  end
end

RSpec.feature 'existing machines' do
  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    #TODO use factorygirl implementation for test machines instead
    brand = Brand.create!(name: 'TORO')
    machinegroup = Machinegroup.create!(name: 'GAZON')
    machinetype = Machinetype.create!(name: 'ZITMAAIER', machinegroup_id: machinegroup.id)
    @existing_machine = Machine.create!(brand_id: brand.id, model: 'RX22', machinetype_id: machinetype.id )
  end

  scenario 'can be selected and details shown' do
    visit '/machines'
    expect(page).to have_link('RX22')
  end
end