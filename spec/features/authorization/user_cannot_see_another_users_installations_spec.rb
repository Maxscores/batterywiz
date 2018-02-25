describe "A logged in user cannot view another users installation" do
  it "is given a 404 page" do
    user = create(:user)
    installation = create(:installation)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)


    expect {
      visit "/installations/#{installation.id}"
    }.to raise_exception(ActionController::RoutingError)
  end
end
