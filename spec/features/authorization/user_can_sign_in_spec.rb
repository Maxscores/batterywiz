describe "User can visit home page" do
  describe "and they can log in" do
    it "they successfully log in" do
      user = create(:user)

      visit '/'

      click_on "Login"

      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password

      click_on "Log in"
    end
  end
end
