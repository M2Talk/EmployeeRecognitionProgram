require 'rails_helper'

RSpec.describe 'Kudo CRUD test', type: :system do
  let!(:employee) { create(:employee) }
  let!(:employee1) { create(:employee) }

  context 'when want to CRUD kudo' do
    before do
      sign_in(employee)
      visit(root_path)
    end

    it 'CRUD kudo' do
      # create kudo
      click_link 'New Kudo'
      expect(page).to have_content 'New Kudo'

      fill_in 'kudo_title', with: 'Test title'
      fill_in 'kudo_content', with: 'Test content'
      select employee1.email, from: 'kudo_receiver_id'

      click_button 'Create Kudo'
      expect(page).to have_content 'Kudo was successfully created.'

      # edit kudo
      click_link 'Edit'
      fill_in 'Title', with: 'Edited test title'
      fill_in 'Content', with: 'Edited test content'
      click_button 'Update Kudo'

      expect(page).to have_content 'Kudo was successfully updated.'

      # destroy kudo
      click_link 'Destroy'
      expect(page).to have_content 'Kudo was successfully destroyed.'
    end
  end
end
