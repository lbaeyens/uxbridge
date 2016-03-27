require 'rails_helper'

RSpec.feature 'Customers page' do

  scenario 'is not accessible through the Customers link when not logged in' do
    visit '/'
    expect(page).to_not have_link('Customers')
  end

  scenario 'is not accessible through the Customers link when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    expect(page).to have_link('Customers')
  end

end

RSpec.feature 'new customers' do

  scenario 'can be created when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/customers'
    expect(page).to have_link('Add Customer')
  end

  scenario 'cannot be created when no user is logged in' do
    visit '/customers'
    expect(page).not_to have_link('Add Customer')
  end
end
