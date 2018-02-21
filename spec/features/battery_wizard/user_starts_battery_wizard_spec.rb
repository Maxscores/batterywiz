describe "As a user that clicks on battery calculator from the home page" do
  describe "they are brought to the battery wizard", js: true do
    it "and can fill in zipcode and click next step" do
      visit '/'

      click_on "Battery Calculator"

      expect(current_path).to eq("/battery/new")

      fill_in "zipcode", with: 80525
      find("#next-step").click

      expect(current_path).to eq("/battery/new")
      expect(page).to_not have_content("Zipcode")
      expect(page).to have_content("by Utility Bill")
      expect(page).to have_content("by Appliance")
    end

    it "they can click on dropdown sections for step 1 and see content" do
      visit new_battery_path

      expect(page).to_not have_content("Duck Curve")
      all(".section")[0].click
      expect(page).to have_content("Duck Curve")
      all(".section")[0].find("span").click

      expect(page).to_not have_content("Science has not yet")
      all(".section")[1].click
      expect(page).to have_content("Science has not yet")
      all(".section")[1].find("span").click

      expect(page).to_not have_content("Science has not yet")
      all(".section")[2].click
      expect(page).to have_content("Science has not yet")
      all(".section")[2].find("span").click
    end
  end
end
