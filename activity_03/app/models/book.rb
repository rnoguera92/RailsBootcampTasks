class Book < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author, presence: true
  validates :description,  length: { maximum: 250, too_long: "%{count} characters is the maximum allowed" }

end
