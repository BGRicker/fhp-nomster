require "rails_helper"

feature "User edits a place" do
  scenario "Successfully" do
    sign_in_as "test@user.com", "password"
    create_place "Cooltown", "185 Cool Street, Cooltown, CA", "the coolest place"
    first('h1').click_link('Cooltown')

    expect(page).to have_content "Cooltown"
    expect(page).to have_content "185 Cool Street, Cooltown, CA"
    expect(page).to have_content "the coolest place"

    click_on "Edit"
    expect(page).to have_content "Edit Cooltown"
    update_place "Coolertown", "186 Cooler Street, Coolesttown, CA", "an even cooler place"

    expect(page).to_not have_content "Cooltown"
    expect(page).to_not have_content "185 Cool Street, Cooltown, CA"
    expect(page).to_not have_content "the coolest place"
    expect(page).to have_content "Coolertown"
    expect(page).to have_content "186 Cooler Street, Coolesttown, CA"
    expect(page).to have_content "an even cooler place"
  end
end
