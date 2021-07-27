# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it { is_expected.to have_many :types }
  it { is_expected.to have_many :pokemon_types }
end
