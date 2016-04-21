require "rails_helper"

feature "User signs in" do
  scenario "Successfully" do

    sign_in_as "test@user.com"

    expect(page).to have_content "hi test@user.com"
    expect(page).to have_content "Signed in successfully."
  end

  scenario "Unsuccessfully with duplicate email" do
    create_user "test@user.com"

    expect(page).to have_content "Emailhas already been taken"
  end

  scenario "Sees the right links when signed out" do
    visit root_path

    expect(page).not_to have_content "Sign Out"
    expect(page).not_to have_content "hi"
  end

  scenario "Sees the right links when signed in" do
    sign_in_as "test@user.com"

    expect(page).to have_content "Sign Out"
    expect(page).to have_content "hi"
  end
end
