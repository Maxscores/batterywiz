class Installation < ApplicationRecord
  has_one :solar_system
  has_one :consumption

  validates_presence_of :zipcode
end
