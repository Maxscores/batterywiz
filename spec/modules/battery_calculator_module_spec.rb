require 'spec_helper'
require './app/services/battery_calculation_module'

include BatteryCalculationModule

describe "BatteryCalculationModule" do
  describe "methods" do
    describe '#calculate_hourly_net' do
      it "when I input two arrays with specific format I return a result" do
        #array should have 365 arrays (days) where each is an array of 24 floats (hourly energy)
        consumption = Array.new(365, Array.new(24, 1)) # 1 b/c in kW
        production = Array.new(365, Array.new(24, 1111)) # 1111 b/c in W

        result = calculate_hourly_net(consumption, production)

        expect(result.count).to eq(365)
        expect(result.first.count).to eq(24)
        expect(result[0][0]).to eq(0.1)
      end
    end
  end
end
