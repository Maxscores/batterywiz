require 'rails_helper'

RSpec.describe Battery, type: :model do
  describe "validations" do
    it "is invalid without capacity" do
      installation = create(:installation)
      battery = Battery.new(daily_net_energy: [1.2, 1.3], hourly_net_energy: [2.1, 3.1], installation: installation)

      expect(battery).to be_invalid
    end

    it "is invalid without daily_net_energy" do
      installation = create(:installation)
      battery = Battery.new(capacity: 20, hourly_net_energy: [2.1, 3.1], installation: installation)

      expect(battery).to be_invalid
    end

    it "is invalid without hourly_net_energy" do
      installation = create(:installation)
      battery = Battery.new(capacity: 20, daily_net_energy: [2.1, 3.1], installation: installation)

      expect(battery).to be_invalid
    end

    it "is invalid with installation" do
      battery = Battery.new(capacity: 20, daily_net_energy: [2.1, 3.1], hourly_net_energy: [2.1, 3.1])

      expect(battery).to be_invalid
    end

    it "is valid with all" do
      installation = create(:installation)
      battery = Battery.new(capacity: 20, daily_net_energy: [2.1, 3.1], hourly_net_energy: [2.1, 3.1], installation: installation)

      expect(battery).to be_valid
    end
  end
end
