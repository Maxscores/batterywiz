describe "A logged in user with multiple installations" do
  describe "can visit installations" do
    it "and see their installations" do
      user = create(:user)
      i_1, i_2 = create_list(:installation, 2, user: user)
      create(:solar_system, installation: i_1 )
      create(:solar_system, installation: i_2 )
      create(:consumption, installation: i_1 )
      create(:consumption, installation: i_2 )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)

      visit root_path

      click_on "My Installations"

      expect(current_path).to eq("/installations")
      expect(page).to have_link(i_1.id)
      expect(page).to have_content(i_1.zipcode)
      expect(page).to have_content(i_1.solar_system.capacity)

      expect(page).to have_link(i_2.id)
      expect(page).to have_content(i_2.zipcode)
      expect(page).to have_content(i_2.solar_system.capacity)
    end

    it "can click on an installation and see the pace " do
      VCR.use_cassette("installations/user_sees_one_installation") do      
        user = create(:user)
        i_1, i_2 = create_list(:installation, 2, user: user)
        create(:solar_system, installation: i_1 )
        create(:solar_system, installation: i_2 )
        create(:consumption, installation: i_1 )
        create(:consumption, installation: i_2 )

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)

        visit root_path

        click_on "My Installations"

        click_on "#{i_1.id}"

        expect(current_path).to eq("/installations/#{i_1.id}")

        expect(page).to have_content("Solar System Capacity: ")
        expect(page).to have_content("Battery Capacity: ")
        expect(page).to have_content("Azimuth Angle: ")
        expect(page).to have_content("Panel Tilt: ")
        expect(page).to have_content("Array Type: ")
        expect(page).to have_content("Module Type: ")
        expect(page).to have_content("Losses: ")
      end
    end
  end
end
