module Features
  def display_place(place_title)
    have_css ".places li", text: place_title
  end

  def create_place(title, address, description)
    visit root_path
    click_on "New Place"
    fill_in "Name", with: title
    fill_in "Address", with: address
    fill_in "Description", with: description

    click_on "Create"
  end

  def update_place(title, address, description)
    fill_in "Name", with: title
    fill_in "Address", with: address
    fill_in "Description", with: description

    click_on "Update"
  end
end
