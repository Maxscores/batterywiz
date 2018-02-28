FactoryBot.define do
  factory :production do
    installation
    station "Station ID"
    city "Fort Collins"
    state "CO"
    ac [1]*365*24
    dc [1]*365*24
    ac_jan 100
    ac_feb 100
    ac_mar 100
    ac_apr 100
    ac_may 100
    ac_jun 100
    ac_jul 100
    ac_aug 100
    ac_sep 100
    ac_oct 100
    ac_nov 100
    ac_dec 100
    dc_jan 100
    dc_feb 100
    dc_mar 100
    dc_apr 100
    dc_may 100
    dc_jun 100
    dc_jul 100
    dc_aug 100
    dc_sep 100
    dc_oct 100
    dc_nov 100
    dc_dec 100
  end
end
