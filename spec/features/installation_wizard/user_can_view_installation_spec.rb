describe "As a user I can view an installation" do
  it "shows solar system summary" do
    VCR.use_cassette("installation_wizard/user_views_system_summary") do
      user = create(:user)
      installation = create(:installation, user: user)
      consumption = create(:consumption, installation: installation)
      solar_system = create(:solar_system, installation: installation)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit installation_path(installation)

      expect(page).to have_content("Solar System Capacity: #{solar_system.capacity}")
      expect(page).to have_content("Battery Capacity: #{installation.battery_capacity}")
      expect(page).to have_content("Azimuth Angle: #{solar_system.azimuth}")
      expect(page).to have_content("Panel Tilt: #{solar_system.tilt}")
      expect(page).to have_content("Array Type: #{solar_system.array_type}")
      expect(page).to have_content("Module Type: #{solar_system.module_type}")
      expect(page).to have_content("Losses: #{solar_system.losses}")
    end
  end

  it "shows location summary" do
    VCR.use_cassette("installation_wizard/user_views_system_summary") do
      user = create(:user)
      installation = create(:installation, user: user)
      consumption = create(:consumption, installation: installation)
      solar_system = create(:solar_system, installation: installation)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


      visit installation_path(installation)

      production = installation.production

      expect(page).to have_content("Installation Zipcode: #{installation.zipcode}")
      expect(page).to have_content("Weather Station: #{production.station}")
      expect(page).to have_content("Station City: #{production.station_city}")
      expect(page).to have_content("Station State: #{production.station_state}")
      expect(page).to have_content("Average Utility Rate: $0.11")
    end
  end

  it "shows table with consumption and production data" do
    VCR.use_cassette("installation_wizard/user_views_system_summary") do
      user = create(:user)
      installation = create(:installation, user: user)
      consumption = create(:consumption, installation: installation)
      solar_system = create(:solar_system, installation: installation)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


      visit installation_path(installation)

      expect(page).to have_css('#monthly-energy')
      expect(page).to have_css('#spring-equinox')
      expect(page).to have_css('#summer-solstice')
      expect(page).to have_css('#fall-equinox')
      expect(page).to have_css('#winter-solstice')
    end
  end
end
