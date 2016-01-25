require 'rails_helper'

RSpec.feature 'Repair State settings page' do

  scenario 'is accessible when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    expect(page).to have_link('Repair States')
  end

  scenario 'is not accessible when no user is logged in' do
    visit '/'
    expect(page).not_to have_link('Repair States')
  end

  scenario 'enables to add a new Repair State' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    click_link 'Repair States'
    expect(page).to have_link('Add Repair State')
  end
end

RSpec.feature 'new Repair State page' do

  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/settings_repairstates'
    click_link "Add Repair State"
  end

  scenario 'Repair State can be committed when logged in' do
    fill_in 'Description', with: 'opgehaald'
    click_button 'Create Repair State'
    expect(page).to have_content('Repair State has been created.')
  end

  scenario 'Repair State needs to be unique' do
    unique_repairstate = Repairstate.create!(description: 'opgehaald')
    unique_repairstate.save

    fill_in 'Description', with: 'opgehaald'
    click_button 'Create Repair State'
    expect(page).to have_content('Repair State has not been created.')
  end
end
