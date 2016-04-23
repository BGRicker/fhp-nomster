require "rails_helper"

feature "User creates Place" do
  scenario "Successfully" do

    sign_in_as "test@user.com", "password"
    visit new_place_path
    fill_in "Name", with: "Your Cool Place"
    fill_in "Address", with: "123 Awesome Street, Partytown, USA"
    fill_in "Description", with: "Get a load of this pizza place, are you kidding me?"
    click_on "Create"

    expect(page).to have_content "Your Cool Place"
    expect(page).to have_content "123 Awesome Street, Partytown, USA"
    expect(page).to have_content "Get a load of this pizza place, are you kidding me?"
  end
end
