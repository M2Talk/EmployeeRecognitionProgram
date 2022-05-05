require 'rails_helper'

RSpec.describe 'Admin sing in test', type: :system do
  let!(:admin) { create(:admin) }

  it 'Sign in admin account' do
    visit admins_root_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    expect(page).to have_content 'Hello Dear Admin at Dashboard page!'
  end
end
