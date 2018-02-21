class SolarSystem < ApplicationRecord
  belongs_to :installation

  validates_presence_of :capacity, :module_type, :losses, :array_type, :tilt, :azimuth
end
