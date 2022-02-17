class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5,
                                  message: "%{value} is not a valid betwen 0 and 5" }
end
