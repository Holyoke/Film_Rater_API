class Rating < ApplicationRecord
  validates_presence_of :score
  validates_numericality_of :score, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  belongs_to :film
end
