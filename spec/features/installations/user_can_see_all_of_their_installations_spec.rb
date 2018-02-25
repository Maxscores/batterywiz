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

      visit installations_path

      expect(current_path).to eq("/installations")
      expect(page).to have_link(i_1.id)
      expect(page).to have_content(i_1.zipcode)
      expect(page).to have_content(i_1.solar_system.capacity)

      expect(page).to have_link(i_2.id)
      expect(page).to have_content(i_2.zipcode)
      expect(page).to have_content(i_2.solar_system.capacity)
    end
  end
end
