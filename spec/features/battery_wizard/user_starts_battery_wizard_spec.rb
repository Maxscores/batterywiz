describe "As a user that clicks on battery calculator from the home page" do
  describe "they are brought to the battery wizard", js: true do
    it "and can fill in zipcode and click next step" do
      visit '/'

      click_on "Battery Calculator"

      expect(current_path).to eq("/battery/new")

      fill_in "installation[zipcode]", with: 80525
      find("#next-step").click

      expect(current_path).to eq("/battery/new")
      expect(page).to_not have_content("Zipcode")
      expect(page).to have_content("by Utility Bill")
      expect(page).to have_content("by Appliance")
    end

    it "they can click on dropdown sections for step 1 and see content" do
      visit new_battery_path

      all(".section").each do |section|
        section.click
        page.evaluate_script('jQuery.active').zero?
        expect(page).to have_css(".section-text")
        section.find("span").click
      end
    end

    it "they can fill in step one and months of step 2" do
      create_list(:category, 5)
      visit '/'

      click_on "Battery Calculator"

      expect(current_path).to eq("/battery/new")

      fill_in "installation[zipcode]", with: 80525
      find("#next-step").click

      all(".method")[0].click

      fill_in "month[1]", with: 100
      fill_in "month[2]", with: 100
      fill_in "month[3]", with: 100
      fill_in "month[4]", with: 100
      fill_in "month[5]", with: 100
      fill_in "month[6]", with: 100
      fill_in "month[7]", with: 100
      fill_in "month[8]", with: 100
      fill_in "month[9]", with: 100
      fill_in "month[10]", with: 100
      fill_in "month[11]", with: 1000
      fill_in "month[12]", with: 100

      find("#next-step").click
      page.evaluate_script('jQuery.active').zero?

      expect(find_field('system[capacity]').value).to eq '7.67'
    end

    it "click on both options of consumption to see their details" do
      visit "/battery/new"
      find("#nav-consumption").click

      all(".method")[0].click
      expect(page).to have_content("Month")
      expect(page).to have_content("Electricity Used")
      expect(page).to have_content("Next Step")
      all(".method")[0].all("span")[0].click

      all(".method")[1].click
      expect(page).to have_content("Next Step")

      all(".section").each do |section|
        section.click
        page.evaluate_script('jQuery.active').zero?
        expect(page).to have_css(".section-text")
        section.find("span").click
      end
      all(".method")[1].all("span")[0].click
    end

    it "click on solar system dropdowns" do
      visit "/battery/new"
      find("#nav-system").click
      all(".section").each do |section|
        section.click
        page.evaluate_script('jQuery.active').zero?
        expect(page).to have_css(".section-text")
        section.find("span").click
      end
    end
  end
end
