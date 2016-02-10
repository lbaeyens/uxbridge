require 'rails_helper'

RSpec.feature 'machine type settings page' do

  scenario 'is accessible when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    expect(page).to have_link('Machine Types')
  end

  scenario 'is not accessible when no user is logged in' do
    visit '/'
    expect(page).not_to have_link('Machine Types')
  end

  scenario 'enables to add a new machine type' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    click_link 'Machine Types'
    expect(page).to have_link('Add Machine Type')
  end
end