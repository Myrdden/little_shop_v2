FactoryBot.define do
  factory :address_bot do
    sequence :address do |n|
      "12#{n} Test Rd."      
    end
    name {"Home"}
    city {"Springfield"}
    state {"VA"}
    zip {"90210"}
  end
end
