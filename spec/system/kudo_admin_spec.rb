require 'rails_helper'

RSpec.describe 'Kudo Admin RD test', type: :system do
  let!(:admin) { create(:admin) }
  let!(:kudo) { create(:kudo) }

    it 'Visit and delete' do
      visit admins_root_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Log in'
  
      expect(page).to have_content 'Hello Dear Admin at Dashboard page!'

      click_link 'KUDOS'
      click_link 'Destroy'

      expect(page).to have_content 'Kudo was successfully destroyed.'
    end
end