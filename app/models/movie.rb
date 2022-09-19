class Movie < ApplicationRecord
  validates :title, presence: true
  validates :plot, length: { minimum: 5 }
end
