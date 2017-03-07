require 'rails_helper'

RSpec.describe Film, type: :model do
  it { should validate_presence_of(:title) }
  it { should have_many(:ratings) }
end
