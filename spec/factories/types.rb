FactoryBot.define do
  factory :type do
    name { "dummy_name" }
    slot { 1 }
    association :pokemon
  end
end