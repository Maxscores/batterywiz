FactoryBot.define do
  factory :basic_utility_rate do
    residential 0.09
    commercial 0.13
    industrial 0.17
    zipcode "80525"
  end
end
