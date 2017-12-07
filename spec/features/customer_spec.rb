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

RSpec.feature 'existing customers ' do
  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    #TODO use factorygirl implementation for test customers instead
    title = Title.create!(title: 'Familie')
    postalcode = Postalcode.create!(postalcode: 9300)
    @existing_customer = Customer.create!(title_id: title.id, lastname: "Doe", name: "John", address: "kerkstraat 13", postalcode_id: postalcode.id, telephone: "+32 53 21 21 21", mobilephone: "NA", fax: "NA", email: "john.doe@gardner.com", contact: "John", vatnumber: "NA", bankaccount: "NA", remarks: "" )
  end

  scenario 'can be deleted' do
    visit '/customers'
    link = "//a[contains(@href, '/customers/#{@existing_customer.id}') and @data-method='delete']"
    find(:xpath, link).click
    expect(page).to have_content("Customer has been deleted")
  end

  scenario 'can be edited'  do
    visit '/customers'
    find("a[href='/customers/#{@existing_customer.id}/edit']").click
    expect(page).to have_content('Customer details')
    expect(page).to have_field('customer_lastname', with: @existing_customer.lastname)
  end

end