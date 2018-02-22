class Installation < ApplicationRecord
  validates_presence_of :zipcode
  belongs_to :user
  has_one :solar_system
  has_one :consumption
  has_one :production

end
