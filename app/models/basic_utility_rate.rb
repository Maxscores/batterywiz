class BasicUtilityRate < ApplicationRecord
  validates_presence_of :zipcode, :residential, :commercial, :industrial

  def self.get(zipcode)
    data = NrelService.get_avg_utility_rate(zipcode)
    BasicUtilityRate.create(zipcode: data[:inputs][:address],
                            residential: data[:outputs][:residential],
                            commercial: data[:outputs][:commercial],
                            industrial: data[:outputs][:industrial])
  end

end
