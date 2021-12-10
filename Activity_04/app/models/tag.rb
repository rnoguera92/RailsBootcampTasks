# frozen_string_literal: true

# model for tags table
class Tag < ApplicationRecord
  has_and_belongs_to_many :people
  belongs_to :tag_type
  validates :name, uniqueness: true
end
