require 'spec_helper'
require './app/services/consumption_estimation_module'

include ConsumptionEstimationModule

describe "ConsumptionEstimationModule" do
  describe "methods" do
    describe '#estimate_consumption' do
      it "estimates hour by hour consumption for entire year" do
        consumption = [1,2,3,4,5,6,7,8,9,10,11,12]

        result = estimate_consumption(consumption)

        expect(result.count).to eq(365)
        expect(result.flatten.count).to eq(365*24)
        #jan 1st
        expect(result[0][0].round(4)).to eq(0.06)
        #feb 1st
        expect(result[32][0].round(4)).to eq(0.13)
        #mar 1st
        expect(result[60][0].round(4)).to eq(0.19)
      end
    end

    describe '#default_consumption_profile' do
      it "returns array of normalized consumption for 24 hours" do
        result = default_consumption_profile

        expect(result.count).to eq(24)
        expect(result.first.round(4)).to eq(0.0643)
        expect(result.last.round(4)).to eq(0.0395)
      end
    end
  end
end
