describe "As a user that clicks on installation calculator from the home page" do
  describe "they are brought to the installation wizard", js: true do
    it "and can fill in zipcode and click next step" do
      visit '/'

      click_on "Solar Installation Calculator"

      expect(current_path).to eq("/installation/new")

      fill_in "installation[zipcode]", with: 80525
      find("#next-step").click

      expect(current_path).to eq("/installation/new")
      expect(page).to_not have_content("Zipcode")
      expect(page).to have_content("by Utility Bill")
      expect(page).to have_content("by Appliance")
    end

    it "they can fill in step one and months of step 2" do
      visit '/'

      click_on "Solar Installation Calculator"

      expect(current_path).to eq("/installation/new")

      fill_in "installation[zipcode]", with: 80525
      find("#next-step").click

      all(".method")[0].click

      fill_in "consumption[jan]", with: 100
      fill_in "consumption[feb]", with: 100
      fill_in "consumption[mar]", with: 100
      fill_in "consumption[apr]", with: 100
      fill_in "consumption[may]", with: 100
      fill_in "consumption[jun]", with: 100
      fill_in "consumption[jul]", with: 100
      fill_in "consumption[aug]", with: 100
      fill_in "consumption[sep]", with: 100
      fill_in "consumption[oct]", with: 100
      fill_in "consumption[nov]", with: 1000
      fill_in "consumption[dec]", with: 100

      find("#next-step").click
      wait_for_ajax

      expect(find_field('system[capacity]').value).to eq '7.7'
    end

    it "they can fill in complete form and are redirected to summary page" do
      stub_pvwatts_request
      visit '/'

      click_on "Solar Installation Calculator"

      expect(current_path).to eq("/installation/new")

      fill_in "installation[zipcode]", with: 80525
      find("#next-step").click

      all(".method")[0].click

      fill_in "consumption[jan]", with: 100
      fill_in "consumption[feb]", with: 100
      fill_in "consumption[mar]", with: 100
      fill_in "consumption[apr]", with: 100
      fill_in "consumption[may]", with: 100
      fill_in "consumption[jun]", with: 100
      fill_in "consumption[jul]", with: 100
      fill_in "consumption[aug]", with: 100
      fill_in "consumption[sep]", with: 100
      fill_in "consumption[oct]", with: 100
      fill_in "consumption[nov]", with: 1000
      fill_in "consumption[dec]", with: 100

      find("#next-step").click
      page.evaluate_script('jQuery.active').zero?

      expect(find_field('system[capacity]').value).to eq '7.7'
      expect(find_field('system[losses]').value).to eq("14")
      expect(find_field('system[tilt]').value).to eq("30")
      expect(find_field('system[azimuth]').value).to eq("180")

      click_on "Calculate"

      installation = Installation.last
      expect(current_path).to eq("/installation/#{installation.id}")
    end

    it "they can click on dropdown sections for step 1 and see content" do
      visit new_installation_path

      all(".section").each do |section|
        section.click
        wait_for_ajax
        expect(page).to have_css(".section-text")
        section.find("span").click
      end
    end

    it "click on both options of consumption to see their details" do
      create_list(:category, 5)

      visit "/installation/new"
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
        wait_for_ajax
        expect(page).to have_css(".section-text")
        section.find("span").click
      end
      all(".method")[1].all("span")[0].click
    end

    it "click on solar system dropdowns" do
      visit "/installation/new"
      find("#nav-system").click
      all(".section").each do |section|
        section.click
        wait_for_ajax
        expect(page).to have_css(".section-text")
        section.find("span").click
      end
    end
  end
end
