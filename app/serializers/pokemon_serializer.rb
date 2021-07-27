# frozen_string_literal: true

class PokemonSerializer
  include JSONAPI::Serializer

  attribute :name
  attribute :height
  attribute :weight
  attribute :base_experience
  attribute :is_default

  has_many :types, include_data: true

  def format_name(attribute_name)
    attribute_name.to_s.underscore
  end
end
