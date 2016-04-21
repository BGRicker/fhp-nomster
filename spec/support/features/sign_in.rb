module Features
  def sign_in
    sign_in_as "test@user.com"
  end

  def create_user(email)
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: email
    fill_in "Password", with: "password", :match => :prefer_exact
    fill_in "Password confirmation", with: "password", :match => :prefer_exact

    click_on "Sign up"
  end

  def sign_in_as(email)
    visit new_user_session_path
    fill_in "Email", with: email
    fill_in "Password", with: "password"
    click_on  "Log in"
  end
end
