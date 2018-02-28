require 'rails_helper'

RSpec.describe Consumption, type: :model do
  describe "instance methods" do
    let(:installation) {create(:installation)}
    let(:consumption) {
      create(:consumption,
      feb: "100",
      mar: "100",
      apr: '100',
      may: '100',
      jun: '100',
      jul: '100',
      aug: '100',
      sep: '100',
      oct: '100',
      nov: '100',
      dec: "100",
      installation: installation)
    }

    describe '#monthly_consumption' do
      it "consumption for that month" do
        expect(consumption.monthly_consumption[1]).to eq(100.0)
        expect(consumption.monthly_consumption[2]).to eq(100.0)
        expect(consumption.monthly_consumption[3]).to eq(100.0)
        expect(consumption.monthly_consumption[4]).to eq(100.0)
        expect(consumption.monthly_consumption[5]).to eq(100.0)
        expect(consumption.monthly_consumption[6]).to eq(100.0)
        expect(consumption.monthly_consumption[7]).to eq(100.0)
        expect(consumption.monthly_consumption[8]).to eq(100.0)
        expect(consumption.monthly_consumption[9]).to eq(100.0)
        expect(consumption.monthly_consumption[10]).to eq(100.0)
        expect(consumption.monthly_consumption[11]).to eq(100.0)
        expect(consumption.monthly_consumption[12]).to eq(100.0)
      end
    end

    describe '#avg_daily_consumption_by_month' do
      it "returns array with values for each month of year" do
        result = consumption.avg_daily_consumption_by_month

        expect(result.count).to eq(12)
        expect(result).to be_a Array
        expect(result.first.round(2)).to eq(3.23)
      end
    end

    describe '#daily_consumption' do
      it "returns array with values for each day of year" do
        result = consumption.daily_consumption

        expect(result.count).to eq(365)
        expect(result).to be_a Array
        expect(result[0].round(2)).to eq(3.23)
      end
    end

    describe '#estimated_hourly_consumption' do
      it "returns array of hour by hour consumption for entire year" do
        result = consumption.estimated_hourly_consumption

        expect(result.flatten.count).to eq(365*24)
        expect(result).to be_a Array
        expect(result[0]).to be_a Array
        expect(result[0][0].round(2)).to eq(0.21)
      end
    end
  end

  describe "validations" do
    it "is invalid without jan" do
      installation = create(:installation)
      consumption = Consumption.new(
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without feb" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without mar" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without apr" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without may" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without jun" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without jul" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without aug" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without sep" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without oct" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without nov" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without dec" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        installation: installation)

      expect(consumption).to be_invalid
    end

    it "is invalid without installation" do
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100")

      expect(consumption).to be_invalid
    end

    it "is valid" do
      installation = create(:installation)
      consumption = Consumption.new(
        jan: "100",
        feb: "100",
        mar: "100",
        apr: '100',
        may: '100',
        jun: '100',
        jul: '100',
        aug: '100',
        sep: '100',
        oct: '100',
        nov: '100',
        dec: "100",
        installation: installation)

      expect(consumption).to be_valid
    end
  end
end
