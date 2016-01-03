require 'rails_helper'

RSpec.feature 'brand settings page' do

  scenario 'is accessible when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    expect(page).to have_link('Brands')
  end

  scenario 'is not accessible when no user is logged in' do
    visit '/'
    expect(page).not_to have_link('Brands')
  end

  scenario 'enables to add a new brand' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    click_link 'Brands'
    expect(page).to have_link('Add Brand')
  end
end

RSpec.feature 'new brand page' do

  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/settings_brands'
    click_link 'Add Brand'
  end

  scenario 'brand can be committed when logged in' do
    fill_in 'Brand name', with: 'TORO'
    click_button 'Create Brand'
    expect(page).to have_content('Brand has been created.')
  end

  scenario 'brand needs to be unique' do
    unique_brand = Brand.create!(name: 'TORO')
    unique_brand.save

    fill_in 'Brand name', with: 'TORO'
    click_button 'Create Brand'
    expect(page).to have_content('Brand has not been created.')
  end
end
