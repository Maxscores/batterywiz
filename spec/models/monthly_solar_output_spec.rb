require 'rails_helper'

RSpec.describe MonthlySolarOutput, type: :model do
  describe "class methods" do
    describe '#find_or_get_by_zipcode' do
      it "performs an API call to get data for zipcode if not in db" do
        VCR.use_cassette("models/get_monthly_solar_ouput") do
          not_in_db = MonthlySolarOutput.find_by(zipcode: 80525)

          expect(not_in_db).to be_nil

          output = MonthlySolarOutput.find_or_get_by_zipcode(80525)

          expect(output).to be_a MonthlySolarOutput
          expect(output.avg_daily_production_by_month.count).to eq(12)
        end
      end

      it "gets data for zipcode if in db" do
        create(:monthly_solar_output, zipcode: 80525)

        in_db = MonthlySolarOutput.find_by(zipcode: 80525)

        expect(in_db).to be_a MonthlySolarOutput

        output = MonthlySolarOutput.find_or_get_by_zipcode(80525)

        expect(output).to be_a MonthlySolarOutput
        expect(output.id).to eq(in_db.id)
      end

      it "returns nil if NREL has no solar data for location" do
        VCR.use_cassette("models/no_monthly_solar_ouput") do
          not_in_db = MonthlySolarOutput.find_by(zipcode: 99501)

          expect(not_in_db).to be_nil

          output = MonthlySolarOutput.find_or_get_by_zipcode(99501)

          expect(output).to be_nil
        end
      end
    end
  end

  describe "instance methods" do
    describe '#avg_daily_production_by_month' do
      it "returns an array with daily production by month" do
        monthly_solar_output = create(:monthly_solar_output, zipcode: 80525)

        expect(monthly_solar_output.avg_daily_production_by_month.count).to eq(12)
        expect(monthly_solar_output.avg_daily_production_by_month.first).to eq(5)
        expect(monthly_solar_output.avg_daily_production_by_month[6]).to eq(20)
        expect(monthly_solar_output.avg_daily_production_by_month.last).to eq(10)
      end
    end
  end
end
