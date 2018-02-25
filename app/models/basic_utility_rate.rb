class BasicUtilityRate < ApplicationRecord
  validates_presence_of :zipcode, :residential, :commercial, :industrial

  def self.get(zipcode)
    data = NrelService.get_avg_utility_rate(zipcode)
    BasicUtilityRate.create(zipcode: data[:inputs][:address],
                            residential: data[:outputs][:residential],
                            commercial: data[:outputs][:commercial],
                            industrial: data[:outputs][:industrial])
  end

  def update_from_nrel(zipcode)
    data = NrelService.get_avg_utility_rate(zipcode)
    update(residential: data[:outputs][:residential],
           commercial: data[:outputs][:commercial],
           industrial: data[:outputs][:industrial])
  end

  def self.find_or_get_utility_rate_by_zipcode(zipcode)
    if utility_rate = BasicUtilityRate.where("updated_at > ?", 1.month.ago).find_by(zipcode: zipcode)
      utility_rate
    elsif utility_rate = BasicUtilityRate.find_by(zipcode: zipcode)
      utility_rate.update_from_nrel(zipcode)
    else
      BasicUtilityRate.get(zipcode)
    end
  end
end
