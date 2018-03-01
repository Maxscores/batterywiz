describe "User visits battery installation wizard" do
  describe "user enters zipcode for a location without data" do
    it "gets redirected back to location input with a message" do
      VCR.use_cassette("installation_wizard/no-data") do
        visit new_installation_path

        fill_in "installation_zipcode", with: "99501"

        click_on "Next Step"

        click_on "Next Step"

        expect(current_path).to eq("/installations/new")
        expect(page).to have_content("There is no solar data for this location, please try another location")
      end
    end
  end
end
