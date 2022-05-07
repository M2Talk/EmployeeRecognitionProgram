require 'rails_helper'

RSpec.describe 'Kudo CRUD test', type: :system do
  let!(:employee) { create(:employee) }
  let!(:kudo) { create(:kudo) }

    it "creates available kudos" do
      # Login
      visit(root_path)
      fill_in 'Email', with: employee.email
      fill_in 'Password', with: employee.password
      click_button 'Log in'

      while employee.number_of_available_kudos > 0
        # create kudo
        click_link 'New Kudo'
        expect(page).to have_content 'New Kudo'

        fill_in 'kudo_title', with: 'Test title'
        fill_in 'kudo_content', with: 'Test content'

        click_button 'Create Kudo'
        expect(page).to have_content 'Kudo was successfully created.'
      end

        # create kudo when available == 0
        click_link 'New Kudo'
        expect(page).to have_content 'New Kudo'

        fill_in 'kudo_title', with: 'Test title'
        fill_in 'kudo_content', with: 'Test content'

        click_button 'Create Kudo'
        expect(page).to have_content 'Not enough available kudos to create new one!'
    end
end
