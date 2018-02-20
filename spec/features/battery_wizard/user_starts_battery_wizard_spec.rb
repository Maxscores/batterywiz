describe "As a user that clicks on battery calculator from the home page" do
  describe "I am brought to the installation new page" do
    it "I enter my zipcode and press submit" do
      create_list(:category, 2)

      visit '/'

      click_on 'Battery Calculator'

      expect(page).to have_content "Zipcode"

      fill_in "installation[zipcode]", with: "99999"
      click_on "Begin"

      expect(current_path).to eq("/battery_wizard/consumption/new")
      expect(Installation.last.zipcode).to eq("99999")
    end
  end
end
