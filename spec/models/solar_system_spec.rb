require 'rails_helper'

RSpec.describe SolarSystem, type: :model do
  describe "before_save methods" do
    describe "#build_production" do
      it "creates an entry in the db for the NREL PVWatts performance before it is saved" do
        VCR.use_cassette("models/solar_system_build_production") do
          installation = create(:installation, zipcode: 80525)
          consumption = create(:consumption, installation: installation)

          expect(installation.production).to be_nil

          solar_system = create(:solar_system, installation: installation)

          expect(installation.production).to be_a Production
        end
      end

      it "if production data is already cached for installation, delete and rebuild" do
        VCR.use_cassette("models/solar_system_build_production") do
          installation = create(:installation, zipcode: 80525)
          consumption = create(:consumption, installation: installation)
          production = create(:production, installation: installation)

          original_production_id = production.id

          expect(installation.production).to be_a Production

          solar_system = create(:solar_system, installation: installation)

          expect(installation.production.id).to_not eq(original_production_id)
        end
      end
    end

    describe '#build_battery' do
      it "creates a battery based peak usage" do
        VCR.use_cassette("models/solar_system_create_battery") do
          create(:monthly_solar_output, zipcode: 80525)
          installation = create(:installation, zipcode: 80525)
          create(:consumption, installation: installation)
          create(:production, installation: installation)

          expect(installation.battery).to be_nil

          create(:solar_system, installation: installation)

          expect(installation.battery).to be_a Battery
        end
      end
    end
  end
end
