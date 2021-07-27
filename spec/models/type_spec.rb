require 'rails_helper'

RSpec.describe Type, type: :model do
  it { is_expected.to belong_to :pokemon }
end
