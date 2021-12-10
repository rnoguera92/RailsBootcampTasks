# frozen_string_literal: true

# model for tag_types table
class TagType < ApplicationRecord
  validates :name, uniqueness: true
end
