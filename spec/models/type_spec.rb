# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Type, type: :model do
  it { is_expected.to have_many :pokemons }
  it { is_expected.to have_many :pokemon_types }
end
