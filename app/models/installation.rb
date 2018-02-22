class Installation < ApplicationRecord
  validates_presence_of :zipcode
  has_one :solar_system
  has_one :consumption

  def production
    
  end
end
