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