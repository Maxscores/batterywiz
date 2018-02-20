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

  context "I have filled in my installation location" do
    describe "and am on the consumption profile page" do
      it "I enter my consumption by month information", js: true do
        create_list(:category, 2)

        visit '/'

        click_on 'Battery Calculator'

        fill_in "installation[zipcode]", with: "80525"
        click_on "Begin"

        click_on "Utility Bill"
        fill_in "consumption[january]", with: 100
        fill_in "consumption[february]", with: 100
        fill_in "consumption[march]", with: 100
        fill_in "consumption[april]", with: 100
        fill_in "consumption[may]", with: 100
        fill_in "consumption[june]", with: 100
        fill_in "consumption[july]", with: 100
        fill_in "consumption[august]", with: 100
        fill_in "consumption[september]", with: 100
        fill_in "consumption[october]", with: 100
        fill_in "consumption[november]", with: 100
        fill_in "consumption[december]", with: 100

        click_on "Next"

        expect(current_path).to eq("/battery_wizard/system/new")
        expect(Consumption.last.jan).to eq(100)
      end
    end
  end
end
