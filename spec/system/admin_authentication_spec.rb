require 'rails_helper'

RSpec.describe 'Admin sign in test', type: :system do
  let!(:admin_user) { create(:admin_user) }

  it 'Sign in admin account' do
    visit admin_root_path
    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: admin_user.password
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Welcome Dear Admin!'

    click_link 'Sign out'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
