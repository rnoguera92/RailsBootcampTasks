class Book < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :author, presence: true
  validates :description,  length: { maximum: 250, too_long: "%{count} characters is the maximum allowed" }

end
