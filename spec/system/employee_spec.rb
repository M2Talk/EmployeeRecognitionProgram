require 'rails_helper'

RSpec.describe 'Employee account test', type: :system do
  let!(:employee) { create(:employee) }

  it 'Setup employee account' do
    visit root_path
    first(:link, 'Sign up').click
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    fill_in 'Password confirmation', with: employee.password
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'

    click_link 'Sign out'
    click_button 'Log in'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
