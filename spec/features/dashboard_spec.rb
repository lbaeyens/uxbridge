require 'rails_helper'

RSpec.feature 'uxbridge home page' do

  scenario 'has a link to sign in' do
    visit '/'
    expect(page).to have_link('Sign in')
  end

  scenario 'has a link to sign up' do
    visit '/'
    expect(page).to have_link('Sign up')
  end
end
