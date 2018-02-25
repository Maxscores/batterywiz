VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
end

describe "As a user that clicks on installation calculator from the home page" do
  describe "they are brought to the installation wizard" do
    it "and can fill in zipcode and click next step" do
      visit '/'

      click_on "Solar Installation Calculator"

      expect(current_path).to eq("/installations/new")

      fill_in "installation[zipcode]", with: 80525
      click_on "Next Step"

      expect(current_path).to eq("/consumptions/new")
      expect(page).to_not have_content("Zipcode")
      expect(page).to have_content("")
    end

    it "they can fill in step one and months of step 2" do
      VCR.use_cassette("features/installation-wizard-part-2") do
        visit '/'

        click_on "Solar Installation Calculator"

        expect(current_path).to eq("/installations/new")

        fill_in "installation[zipcode]", with: 80525
        click_on "Next Step"

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

        click_on "Next Step"

        expect(find_field('solar_system_capacity').value).to eq '8.7'
      end
    end

    it "they can fill in complete form and are redirected to summary page" do
      VCR.use_cassette("features/installation_wizard/pvwatts") do
        visit '/'

        click_on "Solar Installation Calculator"

        expect(current_path).to eq("/installations/new")

        fill_in "installation[zipcode]", with: 80525
        click_on "Next Step"

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

        click_on "Next Step"

        expect(find_field('solar_system_capacity').value).to eq '8.7'
        expect(find_field('solar_system_losses').value).to eq("14")
        expect(find_field('solar_system_tilt').value).to eq("30")
        expect(find_field('solar_system_azimuth').value).to eq("180")

        click_on "Calculate"

        installation = Installation.last
        expect(current_path).to eq("/installations/#{installation.id}")
      end
    end

    it "they can click on dropdown sections for step 1 and see content", js: true do
      visit new_installation_path

      all(".section").each do |section|
        section.click
        wait_for_ajax
        expect(page).to have_css(".section-text")
        section.find("span").click
      end
    end

    it "click on solar system dropdowns", js: true do
      visit "/installations/new"
      fill_in "installation[zipcode]", with: 80525
      click_on "Next Step"

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

      click_on "Next Step"
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
