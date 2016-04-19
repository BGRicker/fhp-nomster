require 'rails_helper'

feature "Pages index shows as root page" do
  scenario "successfully" do
    visit "/"
    expect(page).to have_content('Welcome')
  end
end
