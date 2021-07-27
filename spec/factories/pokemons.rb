FactoryBot.define do
  factory :pokemon do
    name { "Jungle" }
    height { 60 }
    weight  { 20 }
    base_experience { 68 }
    is_default { true }
  end
end