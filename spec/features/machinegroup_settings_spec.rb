require 'rails_helper'

RSpec.feature 'machine group settings page' do

  scenario 'is accessible when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    expect(page).to have_link('Machine Groups')
  end

  scenario 'is not accessible when no user is logged in' do
    visit '/'
    expect(page).not_to have_link('Machine Groups')
  end

  scenario 'enables to add a new machine group' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    click_link 'Machine Groups'
    expect(page).to have_link('Add Machine Group')
  end
end

RSpec.feature 'new Machine Group page' do

  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/settings_machinegroups'
    click_link 'Add Machine Group'
  end

  scenario 'machine group can be committed when logged in' do
    fill_in 'Machine Group name', with: 'Gazon'
    click_button 'Create Machine Group'
    expect(page).to have_content('Machine Group has been created.')
  end

  scenario 'machine group needs to be unique' do
    unique_group = Machinegroup.create!(name: 'Gazon')
    unique_group.save

    fill_in 'Machine Group name', with: 'Gazon'
    click_button 'Create Machine Group'
    expect(page).to have_content('Machine Group has not been created.')
  end
end
