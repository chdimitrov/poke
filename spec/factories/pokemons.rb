# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    name { 'Jungle' }
    height { 60 }
    weight { 20 }
    base_experience { 68 }
    is_default { true }
    after(:create) do |pokemon|
      type = FactoryBot.create(:type)
      type.name = 'orange'
      pokemon.pokemon_types.create(type_id: type.id)
    end
  end
end
