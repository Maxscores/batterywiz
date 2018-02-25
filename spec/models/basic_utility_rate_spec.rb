describe BasicUtilityRate do
  describe "instance methods" do
    describe "#find_or_get_utility_rate_by_zipcode" do
      it "gets a utility rate if one doesn't exist in the database" do
        VCR.use_cassette("models/basic_utility_rate/rate_not_in_db") do
          basic = BasicUtilityRate.find_or_get_utility_rate_by_zipcode(80525)

          basic.residential
          basic.commercial
          basic.industrial
          expect(basic.zipcode).to eq("80525")
        end
      end

      it "doesn't get a utility rate if one doesn't exist in the database" do
        create(:basic_utility_rate, zipcode: "80525")

        BasicUtilityRate.find_or_get_utility_rate_by_zipcode(80525)
      end

      it "updates a utility rate if the last updated at is over 1 months ago" do
        VCR.use_cassette("models/basic_utility_rate/update_rate") do
          create(:basic_utility_rate, zipcode: "80525", updated_at: 2.months.ago)

          rate = BasicUtilityRate.find_or_get_utility_rate_by_zipcode(80525)

          expect(rate.updated_at > 1.month.ago).to eq(true)
        end
      end
    end
  end
end
