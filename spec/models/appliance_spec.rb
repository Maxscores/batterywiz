require 'rails_helper'

RSpec.describe Appliance, type: :model do
  describe "Validations" do
    it "must have name" do
      category = Category.create!(title: "Category")
      appliance = Appliance.new(avg_monthly_kwh: 1, category: category)

      expect(appliance).to be_invalid
    end

    it "must have avg monthly kwh" do
      category = Category.create!(title: "Category")
      appliance = Appliance.new(name: "Appliance", category: category)

      expect(appliance).to be_invalid
    end

    it "must have category" do
      appliance = Appliance.new(name: "Appliance", avg_monthly_kwh: 1)

      expect(appliance).to be_invalid
    end

    it "is valid" do
      category = Category.create!(title: "Category")
      appliance = Appliance.new(name: "Appliance", avg_monthly_kwh: 1, category: category)

      expect(appliance).to be_valid
      expect(appliance.name).to eq("Appliance")
      expect(appliance.avg_monthly_kwh).to eq(1)
      expect(appliance.category).to eq(category)
    end
  end
end
