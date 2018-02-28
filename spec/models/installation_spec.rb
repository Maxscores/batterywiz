require 'rails_helper'

RSpec.describe Installation, type: :model do
  describe 'instance methods' do
    describe '#calculate_array_size' do
      it "it calculates array size" do
        create(:monthly_solar_output, zipcode: 80525)
        installation = create(:installation, consumption: create(:consumption), zipcode: 80525)

        result = installation.calculate_array_size
        expect(result).to eq(0.74)
      end
    end

    describe '#estimate_hourly_net_energy' do
      it "estimates hour by hour net energy" do
        production = create(:production)
        consumption = create(:consumption)
        installation = create(:installation, production: production, consumption: consumption, zipcode: 80525)

        result = installation.estimate_hourly_net_energy

        first_result = (production.hourly_dc.first/1000 - consumption.avg_daily_consumption.first * 3.9 / 60.7).round(1)

        expect(result.count).to eq(365)
        expect(result.flatten.count).to eq(365*24)
        expect(result[0][0]).to eq(first_result)
      end
    end
  end
end
