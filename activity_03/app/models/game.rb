class Game < ApplicationRecord
  belongs_to :platform
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description,  length: { maximum: 250, too_long: "%{count} characters is the maximum allowed" }
end
