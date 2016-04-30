require "rails_helper"

feature "User sees the place's show page" do
  scenario "Successfully" do

    sign_in_as "test@user.com", "password"
    create_place "Cooltown", "the coolest place", "185 Cool Street, Cooltown, CA"
    first(:link).click

    expect(page).to have_content "Cooltown"
    expect(page).to have_content "185 Cool Street, Cooltown, CA"
    expect(page).to have_content "the coolest place"
  end

end
