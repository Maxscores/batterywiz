FactoryBot.define do
  factory :solar_system do
    installation
    capacity 4
    module_type 1
    losses 10
    array_type 1
    tilt 40
    azimuth 180
  end
end
