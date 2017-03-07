class Film < ApplicationRecord
  validates_presence_of :title
  has_many :ratings
end
