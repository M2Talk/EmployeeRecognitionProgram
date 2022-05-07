require 'rails_helper'
# frozen_string_literal: true
RSpec.describe 'Admin employees spec', type: :feature do
  let!(:admin) { create(:admin) }
  let!(:employee) { create(:employee) }

  it 'all employees' do
    visit admins_root_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    click_link 'Employees'

    expect(page).to have_content 'Employees Email Number of kudos'

    click_link 'Edit'

    expect(page).to have_content 'Editing Employee'

    fill_in 'Email', with: 'edited_test@test.com'
    fill_in 'Password', with: 'edited_password'

    click_button 'Update Employee'

    expect(page).to have_content 'Employee was successfully updated.'
    expect(page).to have_content 'edited@test.pl'

    visit root_path

    fill_in 'Email', with: 'edited_test@test.com'
    fill_in 'Password', with: 'edited_password'

    click_button 'Log in'

    expect(page).to have_content 'success'

    visit admins_root_path

    click_link 'Employees'

    expect(page).to have_content 'Employees Email Number of kudos'

    click_link 'Edit'

    expect(page).to have_content 'Editing Employee'

    fill_in 'Employee', with: 'edited_test2@test.com'

    click_button 'Update Employee'

    expect(page).to have_content 'Employee was successfully updated.'
    expect(page).to have_content 'edited_test2@test.com'

    visit root_path
    click_link 'Sign Out'

    fill_in 'Employee', with: 'edited_test2@test.com'
    fill_in 'Password', with: 'edited_password'

    click_button 'Log in'

    expect(page).to have_content 'success'
    click_link 'Sign Out'

    visit admins_root_path

    fill_in 'Admin', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    click_link 'Employees'

    expect(page).to have_content 'Employees Email Number of kudos'

    click_link 'Destroy'

    expect(page).to have_content 'Employee was successfully destroyed.'
  end
end