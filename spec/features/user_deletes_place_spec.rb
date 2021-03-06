require "rails_helper"

feature "User deletes a place" do
  scenario "Successfully" do
    sign_in_as "test@user.com", "password"
    create_place "Cooltown", "185 Cool Street, Cooltown, CA"*3, "the coolest place "*4
    first('h1').click_link('Cooltown')

    expect(page).to have_content "Cooltown"
    expect(page).to have_content "185 Cool Street, Cooltown, CA"
    expect(page).to have_content "the coolest place "

    expect { click_on 'Destroy' }.to change(Place, :count).by(-1)
  end

  scenario "Unsuccessfully" do
    sign_in_as "test@user.com", "password"
    create_place "Cooltown", "185 Cool Street, Cooltown, CA", "the coolest place "*4
    sign_out
    first('h1').click_link('Cooltown')

    expect(page).to have_content "Cooltown"
    expect(page).to have_content "185 Cool Street, Cooltown, CA"
    expect(page).to have_content "the coolest place "

    expect(page).to_not have_content "Destroy"
  end
end
