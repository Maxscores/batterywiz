describe "As a logged in user with an installation" do
  describe "when I visit installation index page I see options to edit an installation" do
    it "I can update the zipcode for an installation" do
      VCR.use_cassette("edit_installation/user_can_edit_location") do
        user = create(:user)
        i_1, i_2 = create_list(:installation, 2, user: user, zipcode: 11111)
        create(:solar_system, installation: i_1 )
        create(:solar_system, installation: i_2 )
        create(:consumption, installation: i_1 )
        create(:consumption, installation: i_2 )

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)

        visit root_path

        click_on "My Installations"

        within "#installation-#{i_1.id}" do
          expect(page).to_not have_content("80301")
          click_on "Edit Location"
        end

        expect(current_path).to eq("/installations/#{i_1.id}/edit")

        fill_in "installation_zipcode", with: "80301"

        click_on "Update"

        expect(current_path).to eq("/installations")
        expect(page).to have_content("The Installation was Successfully Updated")
      end
    end

    it "I can update the solar system for an installation" do
      VCR.use_cassette("edit_installation/user_can_edit_solar_system") do
        user = create(:user)
        i_1, i_2 = create_list(:installation, 2, user: user, zipcode: 11111)
        create(:solar_system, installation: i_1 )
        create(:solar_system, installation: i_2 )
        create(:consumption, installation: i_1 )
        create(:consumption, installation: i_2 )

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)

        visit root_path

        click_on "My Installations"

        within "#installation-#{i_1.id}" do
          expect(page).to_not have_content(4.5)
          click_on "Edit Solar System"
        end

        expect(current_path).to eq("/solar_systems/#{i_1.solar_system.id}/edit")

        fill_in "solar_system_capacity", with: 4.5

        click_on "Update"

        expect(current_path).to eq("/installations")
        expect(page).to have_content("The Solar System was Successfully Updated")
      end
    end

    it "I can update the consumption for an installation" do
      VCR.use_cassette("edit_installation/user_can_edit_solar_system") do
        user = create(:user)
        i_1, i_2 = create_list(:installation, 2, user: user, zipcode: 11111)
        create(:solar_system, installation: i_1 )
        create(:solar_system, installation: i_2 )
        create(:consumption, installation: i_1 )
        create(:consumption, installation: i_2 )

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)

        visit root_path

        click_on "My Installations"

        within "#installation-#{i_1.id}" do
          click_on "Edit Consumption"
        end

        expect(current_path).to eq("/consumptions/#{i_1.consumption.id}/edit")

        fill_in "consumption_jan", with: "100"

        click_on "Update"

        expect(current_path).to eq("/installations")
        expect(page).to have_content("The Consumption was Successfully Updated")
      end
    end
  end
end
