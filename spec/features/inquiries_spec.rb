require 'rails_helper'

RSpec.feature "Inquiries", type: :feature do
  scenario 'user can complete and submit the form' do
    visit contact_path

    fill_in 'Name', with: "Ryan"
    fill_in 'Email', with: "ryan@beard.com"
    fill_in 'Subject', with: "I have a beard"
    fill_in 'Message', with: "It's a good one."

    click_button 'Send message'

    expect(page).to have_content('Thanks')
  end
end
