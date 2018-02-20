class Appliance < ApplicationRecord
  belongs_to :category
  validates_presence_of :name, :avg_monthly_kwh
end
