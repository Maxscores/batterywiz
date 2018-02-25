describe "User can visit root page" do
  describe "and can sign up for an account" do
    it "redirects them back to the root page signed in" do
      visit '/'

      click_on "Sign Up"

      expect(current_path).to eq("/users/sign_up")

      fill_in "user_first_name", with: "Max"
      fill_in "user_last_name", with: "Stackhouse"
      fill_in "user_email", with: "max@email.com"
      fill_in "user_password", with: "123456"
      fill_in "user_password_confirmation", with: "123456"

      click_on "Sign up"

      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(current_path).to eq("/")
      expect(page).to have_content("Logout")
      expect(page).to have_content("My Installations")
      expect(page).to have_content("Edit Account")
    end
  end
end
