require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    it "must have title" do
      category = Category.new

      expect(category).to be_invalid
    end

    it "must have unique title" do
      Category.create!(title: "not unique")
      category = Category.new(title: "not unique")

      expect(category).to be_invalid
    end

    it "is valid" do
      category = Category.create!(title: "category")

      expect(category).to be_valid
      expect(category.title).to eq("category")
    end
  end
end
