require 'rails_helper'

RSpec.feature 'title settings page' do

  scenario 'is accessible when user is logged in' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    expect(page).to have_link('Titles')
  end

  scenario 'is not accessible when no user is logged in' do
    visit '/'
    expect(page).not_to have_link('Titles')
  end

  scenario 'enables to add a new Title' do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/'
    click_link 'Titles'
    expect(page).to have_link('Add Title')
  end
end

RSpec.feature 'new Title page' do

  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    login_as @john
    visit '/settings_titles'
    click_link 'Add Title'
  end

  scenario 'title can be committed when logged in' do
    fill_in 'Title', with: 'EBVBA'
    click_button 'Create Title'
    expect(page).to have_content('Title has been created.')
  end

  scenario 'title needs to be unique' do
    unique_title = Title.create!(title: 'EBVBA')
    unique_title.save

    fill_in 'Title', with: 'EBVBA'
    click_button 'Create Title'
    expect(page).to have_content('Title has not been created.')
  end
end
