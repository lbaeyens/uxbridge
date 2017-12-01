require 'rails_helper'

RSpec.feature 'Customers page' do

  scenario 'is not accessible through the Customers link when not logged in' do
    visit '/'
    expect(page).to_not have_link('Customers')
  end

  scenario 'is accessible through the Customers link when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    expect(page).to have_link('Customers')
  end

end

RSpec.feature 'a new customer' do

  scenario 'can be added when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/customers'
    expect(page).to have_link('Add Customer')
  end

  scenario 'cannot be added when no user is logged in' do
    visit '/customers'
    expect(page).not_to have_link('Add Customer')
  end
end

RSpec.feature 'new customer details ' do
  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/customers'
    click_link 'Add Customer'
  end

  scenario 'can be committed when logged in' do
    find('#customer_title_id').find(:xpath, 'option[1]').select_option
    click_button 'Add customer'
    expect(page).to have_content('Customer has been created.')
  end

end