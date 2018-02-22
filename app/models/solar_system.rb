class SolarSystem < ApplicationRecord
  belongs_to :installation

  validates_presence_of :capacity, :module_type, :losses, :array_type, :tilt, :azimuth

  enum array_type: ["Fixed - Open Rack", "Fixed - Roof Mounted", "1-Axis", "1-Axis Backtracking", "2-Axis"]
  enum module_type: ["Standard", "Premium", "Thin Film"]
end
