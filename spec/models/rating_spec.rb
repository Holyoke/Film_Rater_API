require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100).only_integer }
  it { should belong_to(:film) }
end
